import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/shared_widgets.dart';

class WelcomeCard extends StatelessWidget {
  final String companyName;
  final VoidCallback? onTap;

  const WelcomeCard({super.key, this.companyName = 'My Company', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Row(
          children: [
            // Brain icon box
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.iconBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.inputBorder),
              ),
              child: const Icon(
                Icons.psychology_outlined,
                color: AppColors.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 14),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(color: AppColors.textGrey, fontSize: 13),
                  ),
                  Text(
                    companyName,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const AIBadge(),
          ],
        ),
      ),
    );
  }
}
