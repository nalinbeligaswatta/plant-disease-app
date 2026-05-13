// lib/models/scan_result.dart
import 'package:hive/hive.dart';

part 'scan_result.g.dart';

@HiveType(typeId: 0)
class ScanResult extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String diseaseId;

  @HiveField(2)
  final String diseaseName;

  @HiveField(3)
  final String cropName;

  @HiveField(4)
  final bool isHealthy;

  @HiveField(5)
  final double confidence;

  @HiveField(6)
  final String imagePath;

  @HiveField(7)
  final DateTime scannedAt;

  ScanResult({
    required this.id,
    required this.diseaseId,
    required this.diseaseName,
    required this.cropName,
    required this.isHealthy,
    required this.confidence,
    required this.imagePath,
    required this.scannedAt,
  });
}
