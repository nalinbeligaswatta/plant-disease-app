// lib/utils/app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary greens
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color primaryLight = Color(0xFFE8F5E9);

  // Status colors
  static const Color healthy = Color(0xFF2E7D32);
  static const Color healthyLight = Color(0xFFE8F5E9);
  static const Color diseased = Color(0xFFC62828);
  static const Color diseasedLight = Color(0xFFFFEBEE);
  static const Color warning = Color(0xFFF57C00);

  // Neutrals
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE0E0E0);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
}

class AppCrops {
  static const List<Map<String, String>> crops = [
    {'name': 'Tomato', 'emoji': '🍅'},
    {'name': 'Rice', 'emoji': '🌾'},
    {'name': 'Corn', 'emoji': '🌽'},
    {'name': 'Coconut', 'emoji': '🥥'},
  ];
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
      );
}
