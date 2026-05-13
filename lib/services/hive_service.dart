// lib/services/hive_service.dart
import 'package:hive_flutter/hive_flutter.dart';
import '../models/scan_result.dart';

class HiveService {
  static const String _scanBoxName = 'scan_results';
  static Box<ScanResult>? _scanBox;

  /// Initialize Hive and open boxes
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ScanResultAdapter());
    _scanBox = await Hive.openBox<ScanResult>(_scanBoxName);
  }

  static Box<ScanResult> get scanBox {
    if (_scanBox == null || !_scanBox!.isOpen) {
      throw Exception('Hive scan box is not open. Call initialize() first.');
    }
    return _scanBox!;
  }

  /// Save a scan result
  static Future<void> saveScan(ScanResult result) async {
    await scanBox.put(result.id, result);
  }

  /// Get all scan results sorted by date (newest first)
  static List<ScanResult> getAllScans() {
    final scans = scanBox.values.toList();
    scans.sort((a, b) => b.scannedAt.compareTo(a.scannedAt));
    return scans;
  }

  /// Get scans filtered by crop
  static List<ScanResult> getScansByCrop(String crop) {
    final scans = scanBox.values
        .where((s) => s.cropName.toLowerCase() == crop.toLowerCase())
        .toList();
    scans.sort((a, b) => b.scannedAt.compareTo(a.scannedAt));
    return scans;
  }

  /// Get recent scans (limit)
  static List<ScanResult> getRecentScans({int limit = 5}) {
    final scans = getAllScans();
    return scans.take(limit).toList();
  }

  /// Delete a scan
  static Future<void> deleteScan(String id) async {
    await scanBox.delete(id);
  }

  /// Clear all scan history
  static Future<void> clearAll() async {
    await scanBox.clear();
  }

  /// Get disease occurrence count by crop for this month
  static Map<String, int> getMonthlyDiseaseCounts() {
    final now = DateTime.now();
    final scans = scanBox.values.where((s) =>
        s.scannedAt.month == now.month &&
        s.scannedAt.year == now.year &&
        !s.isHealthy);

    final counts = <String, int>{};
    for (final scan in scans) {
      counts[scan.cropName] = (counts[scan.cropName] ?? 0) + 1;
    }
    return counts;
  }
}
