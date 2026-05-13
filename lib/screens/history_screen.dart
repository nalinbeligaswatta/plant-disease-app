// lib/screens/history_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/scan_provider.dart';
import '../models/scan_result.dart';
import '../data/disease_data.dart';
import '../utils/app_theme.dart';
import 'treatment_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ScanProvider>();
    final history = provider.filteredHistory;
    final counts = provider.monthlyDiseaseCounts;

    const crops = ['All Crops', 'Tomato', 'Rice', 'Corn', 'Coconut'];

    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Profile avatar placeholder
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  child: const Text(
                    'F',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Filter dropdown
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: provider.selectedCropFilter,
                        isExpanded: true,
                        icon: const Icon(Icons.expand_more_rounded,
                            color: AppColors.primary),
                        items: crops
                            .map((c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(c,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: AppColors.textPrimary,
                                      )),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) provider.setCropFilter(val);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Scan list
                  if (history.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            Icon(Icons.history_rounded,
                                size: 52,
                                color:
                                    AppColors.primary.withValues(alpha: 0.3)),
                            const SizedBox(height: 12),
                            const Text(
                              'No scan history yet.',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ...history.map((scan) => _HistoryItem(scan: scan)),

                  const SizedBox(height: 16),

                  // Chart
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Disease Occurrence (This Month)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 180,
                          child: _DiseaseChart(counts: counts),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final ScanResult scan;
  const _HistoryItem({required this.scan});

  @override
  Widget build(BuildContext context) {
    final disease = DiseaseDatabase.getDisease(scan.diseaseId);

    return GestureDetector(
      onTap: () {
        if (disease != null && !scan.isHealthy) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TreatmentScreen(disease: disease),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: File(scan.imagePath).existsSync()
                  ? Image.file(File(scan.imagePath),
                      width: 52, height: 52, fit: BoxFit.cover)
                  : Container(
                      width: 52,
                      height: 52,
                      color: AppColors.primaryLight,
                      child: const Icon(Icons.eco, color: AppColors.primary),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scan.diseaseName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: scan.isHealthy
                          ? AppColors.primary
                          : AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${scan.cropName} • ${_formatDate(scan.scannedAt)}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: scan.isHealthy
                    ? AppColors.healthyLight
                    : AppColors.diseasedLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                scan.isHealthy ? 'Healthy' : 'Diseased',
                style: TextStyle(
                  color:
                      scan.isHealthy ? AppColors.healthy : AppColors.diseased,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _DiseaseChart extends StatelessWidget {
  final Map<String, int> counts;

  const _DiseaseChart({required this.counts});

  @override
  Widget build(BuildContext context) {
    const crops = ['Tomato', 'Rice', 'Corn', 'Coconut'];
    const colors = [
      Color(0xFFE74C3C),
      Color(0xFF3498DB),
      Color(0xFFF39C12),
      Color(0xFF2ECC71),
    ];

    final bars = List.generate(crops.length, (i) {
      final count = (counts[crops[i]] ?? 0).toDouble();
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: count == 0 ? 0.1 : count,
            color: colors[i],
            width: 28,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          ),
        ],
      );
    });

    final maxY = counts.values.isEmpty
        ? 5.0
        : (counts.values.reduce((a, b) => a > b ? a : b) + 2).toDouble();

    return BarChart(
      BarChartData(
        maxY: maxY,
        barGroups: bars,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: (maxY / 4).ceilToDouble(),
          getDrawingHorizontalLine: (_) => const FlLine(
            color: AppColors.border,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (val, _) => Text(
                val.toInt().toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (val, _) {
                final idx = val.toInt();
                if (idx < 0 || idx >= crops.length) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    crops[idx],
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                );
              },
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }
}
