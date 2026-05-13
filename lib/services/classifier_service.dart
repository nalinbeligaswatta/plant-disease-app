// lib/services/classifier_service.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../data/disease_data.dart';

class ClassificationResult {
  final String label;
  final double confidence;
  final int classIndex;

  ClassificationResult({
    required this.label,
    required this.confidence,
    required this.classIndex,
  });
}

class ClassifierService {
  static const String _modelPath = 'assets/model/plant_disease_model.tflite';
  static const int _inputSize = 224;
  static const int _numClasses = 25;

  Interpreter? _interpreter;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  /// Initialize and load the TFLite model
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Load model from assets
      final interpreterOptions = InterpreterOptions();

      // Use GPU delegate on Android if available (optional, graceful fallback)
      // interpreterOptions.addDelegate(GpuDelegate());

      _interpreter = await Interpreter.fromAsset(
        _modelPath,
        options: interpreterOptions,
      );

      _isInitialized = true;
      debugPrint('[ClassifierService] Model loaded successfully');
    } catch (e) {
      debugPrint('[ClassifierService] Error loading model: $e');
      rethrow;
    }
  }

  /// Classify a plant disease from an image file
  Future<ClassificationResult> classify(File imageFile) async {
    if (!_isInitialized || _interpreter == null) {
      throw Exception('Classifier not initialized. Call initialize() first.');
    }

    // 1. Load and decode image
    final imageBytes = await imageFile.readAsBytes();
    img.Image? rawImage = img.decodeImage(imageBytes);

    if (rawImage == null) {
      throw Exception('Failed to decode image');
    }

    // 2. Resize to 224x224
    final resized = img.copyResize(
      rawImage,
      width: _inputSize,
      height: _inputSize,
    );

    // 3. Convert to Float32 tensor [1, 224, 224, 3] normalized to [0, 1]
    final inputTensor = _imageToFloat32List(resized);

    // 4. Prepare output tensor [1, 25]
    final outputTensor =
        List.filled(1 * _numClasses, 0.0).reshape([1, _numClasses]);

    // 5. Run inference
    _interpreter!.run(inputTensor, outputTensor);

    // 6. Get results
    final outputList = outputTensor[0] as List<double>;

    // Find the class with highest confidence
    int maxIndex = 0;
    double maxConfidence = outputList[0];

    for (int i = 1; i < outputList.length; i++) {
      if (outputList[i] > maxConfidence) {
        maxConfidence = outputList[i];
        maxIndex = i;
      }
    }

    final label = DiseaseDatabase.classLabels[maxIndex];

    return ClassificationResult(
      label: label,
      confidence: maxConfidence,
      classIndex: maxIndex,
    );
  }

  /// Converts an img.Image to a Float32List normalized to [0.0, 1.0]
  /// Output shape: [1, 224, 224, 3]
  Float32List _imageToFloat32List(img.Image image) {
    final convertedBytes = Float32List(1 * _inputSize * _inputSize * 3);
    int pixelIndex = 0;

    for (int y = 0; y < _inputSize; y++) {
      for (int x = 0; x < _inputSize; x++) {
        final pixel = image.getPixel(x, y);
        // Normalize RGB to [0, 1] — image 4.x uses pixel.r / .g / .b
        convertedBytes[pixelIndex++] = pixel.r / 255.0;
        convertedBytes[pixelIndex++] = pixel.g / 255.0;
        convertedBytes[pixelIndex++] = pixel.b / 255.0;
      }
    }

    return convertedBytes;
  }

  /// Dispose interpreter to free memory
  void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _isInitialized = false;
  }
}
