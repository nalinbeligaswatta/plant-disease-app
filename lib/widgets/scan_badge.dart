import 'package:flutter/material.dart';

class ScanBadge extends StatelessWidget {
  final bool isHealthy;
  final double confidence;

  const ScanBadge({
    super.key,
    required this.isHealthy,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isHealthy ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${isHealthy ? "Healthy" : "Diseased"} - ${(confidence * 100).toStringAsFixed(1)}%',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
