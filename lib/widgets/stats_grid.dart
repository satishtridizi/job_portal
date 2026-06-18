import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String count;
  final String label;
  final String subLabel;
  final IconData subIcon;
  final Color subIconColor;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    required this.subLabel,
    required this.subIcon,
    this.subIconColor = AppColors.primary,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14), // reduced from 18
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // shrink to content
          children: [
            // Icon box
            Container(
              width: 42, // reduced from 46
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.iconBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.inputBorder),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(height: 10), // reduced from 14
            // Count
            Text(
              count,
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 28, // reduced from 32
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 3), // reduced from 4
            // Label
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textLight,
                fontSize: 13, // reduced from 14
              ),
            ),
            const SizedBox(height: 6), // reduced from 8
            // Sub label row
            Row(
              children: [
                Icon(subIcon, color: subIconColor, size: 13), // reduced from 14
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    subLabel,
                    style: TextStyle(
                      color: subIconColor,
                      fontSize: 11,
                    ), // reduced from 12
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatsGrid extends StatelessWidget {
  final VoidCallback? onActiveJobsTap;
  final VoidCallback? onApplicationsTap;
  final VoidCallback? onNewTap;
  final VoidCallback? onShortlistedTap;

  const StatsGrid({
    super.key,
    this.onActiveJobsTap,
    this.onApplicationsTap,
    this.onNewTap,
    this.onShortlistedTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.05, // slightly wider than tall
      children: [
        StatCard(
          icon: Icons.work_outline_rounded,
          count: '5',
          label: 'Active Jobs',
          subLabel: 'Live',
          subIcon: Icons.trending_up_rounded,
          onTap: onActiveJobsTap,
        ),
        StatCard(
          icon: Icons.people_outline_rounded,
          count: '10',
          label: 'Applications',
          subLabel: 'Total',
          subIcon: Icons.adjust_rounded,
          subIconColor: AppColors.primary,
          onTap: onApplicationsTap,
        ),
        StatCard(
          icon: Icons.schedule_rounded,
          count: '4',
          label: 'New (7 days)',
          subLabel: 'Needs review',
          subIcon: Icons.circle,
          subIconColor: AppColors.primary,
          onTap: onNewTap,
        ),
        StatCard(
          icon: Icons.workspace_premium_outlined,
          count: '2',
          label: 'Shortlisted',
          subLabel: 'Top picks',
          subIcon: Icons.check_circle_outline_rounded,
          subIconColor: AppColors.primary,
          onTap: onShortlistedTap,
        ),
      ],
    );
  }
}
