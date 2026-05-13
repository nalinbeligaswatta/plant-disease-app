// lib/screens/scan_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scan_provider.dart';
import '../utils/app_theme.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  final File imageFile;

  const ScanScreen({super.key, required this.imageFile});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _classify();
    });
  }

  Future<void> _classify() async {
    final provider = context.read<ScanProvider>();
    await provider.classifyImage(widget.imageFile);

    if (!mounted) return;

    if (provider.state == ScanState.success && provider.currentResult != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            imageFile: widget.imageFile,
            result: provider.currentResult!,
          ),
        ),
      );
    } else if (provider.state == ScanState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage ?? 'Classification failed.'),
          backgroundColor: AppColors.diseased,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.file(widget.imageFile, fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withValues(alpha: 0.55)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 3),
                const SizedBox(height: 24),
                const Text(
                  'Analysing your plant...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please wait while we detect diseases',
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
