import 'package:flutter/material.dart';
import '../models/support_model.dart';
import '../utils/app_colors.dart';

class CommonIssuesCard extends StatelessWidget {
  final List<CommonIssue> issues;

  const CommonIssuesCard({super.key, required this.issues});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: AppColors.primary),

              SizedBox(width: 10),

              Text(
                "Common Issues",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ...issues.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  const Text(
                    "•",
                    style: TextStyle(color: AppColors.primary, fontSize: 20),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      e.title,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Check our Help Center for instant solutions",
            style: TextStyle(color: Colors.white38),
          ),
        ],
      ),
    );
  }
}
