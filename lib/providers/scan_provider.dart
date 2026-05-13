// lib/providers/scan_provider.dart
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/scan_result.dart';
import '../services/classifier_service.dart';
import '../services/hive_service.dart';
import '../data/disease_data.dart';

enum ScanState { idle, loading, success, error }

class ScanProvider extends ChangeNotifier {
  final ClassifierService _classifier = ClassifierService();
  final _uuid = const Uuid();

  ScanState _state = ScanState.idle;
  ScanResult? _currentResult;
  String? _errorMessage;
  List<ScanResult> _history = [];
  String _selectedCropFilter = 'All Crops';

  // ── Getters ────────────────────────────────────────
  ScanState get state => _state;
  ScanResult? get currentResult => _currentResult;
  String? get errorMessage => _errorMessage;
  List<ScanResult> get history => _history;
  String get selectedCropFilter => _selectedCropFilter;
  bool get isLoading => _state == ScanState.loading;

  List<ScanResult> get filteredHistory {
    if (_selectedCropFilter == 'All Crops') return _history;
    return _history.where((s) => s.cropName == _selectedCropFilter).toList();
  }

  Map<String, int> get monthlyDiseaseCounts =>
      HiveService.getMonthlyDiseaseCounts();

  // ── Initialization ──────────────────────────────────
  Future<void> initialize() async {
    await _classifier.initialize();
    loadHistory();
  }

  // ── Load History ───────────────────────────────────
  void loadHistory() {
    _history = HiveService.getAllScans();
    notifyListeners();
  }

  // ── Classify Image ─────────────────────────────────
  Future<void> classifyImage(File imageFile) async {
    _state = ScanState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _classifier.classify(imageFile);
      final disease = DiseaseDatabase.getDisease(result.label);

      if (disease == null) {
        throw Exception('Unknown disease class: ${result.label}');
      }

      final scan = ScanResult(
        id: _uuid.v4(),
        diseaseId: result.label,
        diseaseName: disease.name,
        cropName: disease.crop,
        isHealthy: disease.isHealthy,
        confidence: result.confidence,
        imagePath: imageFile.path,
        scannedAt: DateTime.now(),
      );

      // Save to Hive
      await HiveService.saveScan(scan);

      _currentResult = scan;
      _state = ScanState.success;
      loadHistory(); // refresh list
    } catch (e) {
      _errorMessage = 'Classification failed: ${e.toString()}';
      _state = ScanState.error;
    }

    notifyListeners();
  }

  // ── Filter ─────────────────────────────────────────
  void setCropFilter(String crop) {
    _selectedCropFilter = crop;
    notifyListeners();
  }

  // ── Delete ─────────────────────────────────────────
  Future<void> deleteScan(String id) async {
    await HiveService.deleteScan(id);
    loadHistory();
  }

  // ── Reset state ────────────────────────────────────
  void reset() {
    _state = ScanState.idle;
    _currentResult = null;
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _classifier.dispose();
    super.dispose();
  }
}
