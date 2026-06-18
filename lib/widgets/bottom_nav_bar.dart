import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HireHubBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const HireHubBottomNavBar({super.key, this.currentIndex = 2, this.onTap});

  static const List<_NavItem> _items = [
    _NavItem(icon: Icons.people_outline_rounded, label: 'Apps'),
    _NavItem(icon: Icons.work_outline_rounded, label: 'Postings'),
    _NavItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
    _NavItem(
      icon: Icons.chat_bubble_outline_rounded,
      label: 'Messages',
      badge: true,
    ),
    _NavItem(icon: Icons.settings_outlined, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        border: Border(top: BorderSide(color: AppColors.inputBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _items.asMap().entries.map((e) {
            final index = e.key;
            final item = e.value;
            final isSelected = index == currentIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap?.call(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          item.icon,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textGrey,
                          size: 24,
                        ),
                        if (item.badge)
                          Positioned(
                            top: -3,
                            right: -3,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textGrey,
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final bool badge;
  const _NavItem({required this.icon, required this.label, this.badge = false});
}
