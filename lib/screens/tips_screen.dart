// lib/screens/tips_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  static const _tips = [
    (
      icon: Icons.wb_sunny_rounded,
      title: 'Optimal Sunlight',
      body:
          'Most crops need 6–8 hours of direct sunlight daily. Shade-tolerant plants can thrive with 3–4 hours.',
    ),
    (
      icon: Icons.water_drop_rounded,
      title: 'Proper Irrigation',
      body:
          'Water at the base of plants in the early morning. Avoid overhead watering which promotes fungal diseases.',
    ),
    (
      icon: Icons.rotate_right_rounded,
      title: 'Crop Rotation',
      body:
          'Rotate crops each season to prevent build-up of soil-borne pathogens and reduce pest pressure.',
    ),
    (
      icon: Icons.biotech_rounded,
      title: 'Soil Health',
      body:
          'Test your soil pH and nutrients annually. Healthy soil with good organic matter supports disease-resistant plants.',
    ),
    (
      icon: Icons.search_rounded,
      title: 'Early Detection',
      body:
          'Inspect crops weekly for discolouration, wilting, or unusual spots. Early detection greatly improves treatment success.',
    ),
    (
      icon: Icons.eco_rounded,
      title: 'Integrated Pest Management',
      body:
          'Combine biological, cultural, and chemical methods. Use pesticides as a last resort to protect beneficial insects.',
    ),
    (
      icon: Icons.air_rounded,
      title: 'Good Air Circulation',
      body:
          'Space plants adequately and prune dense foliage to reduce humidity and prevent fungal disease spread.',
    ),
    (
      icon: Icons.compost_rounded,
      title: 'Composting',
      body:
          'Add compost to enrich soil with beneficial microbes that naturally suppress harmful pathogens.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farming Tips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Best practices for healthy crops',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _tips.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final tip = _tips[i];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:
                            Icon(tip.icon, color: AppColors.primary, size: 22),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tip.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              tip.body,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
