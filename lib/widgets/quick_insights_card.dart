import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class InsightTile {
  final String count;
  final String label;
  const InsightTile({required this.count, required this.label});
}

class QuickInsightsCard extends StatelessWidget {
  final VoidCallback? onLiveJobsTap;
  final VoidCallback? onPendingTap;
  final VoidCallback? onShortlistedTap;

  static const List<InsightTile> _tiles = [
    InsightTile(count: '5', label: 'Live Jobs'),
    InsightTile(count: '4', label: 'Pending'),
    InsightTile(count: '2', label: 'Shortlisted'),
  ];

  const QuickInsightsCard({
    super.key,
    this.onLiveJobsTap,
    this.onPendingTap,
    this.onShortlistedTap,
  });

  List<VoidCallback?> get _callbacks => [
    onLiveJobsTap,
    onPendingTap,
    onShortlistedTap,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.trending_up_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Quick Insights',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              // AI badge inline
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.iconBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.hub_outlined,
                      color: AppColors.primary,
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'AI',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tiles row
          Row(
            children: _tiles.asMap().entries.map((e) {
              final index = e.key;
              final tile = e.value;
              final cb = _callbacks[index];

              return Expanded(
                child: GestureDetector(
                  onTap: cb,
                  child: Container(
                    margin: EdgeInsets.only(right: index < 2 ? 10 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.iconBg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.inputBorder),
                    ),
                    child: Column(
                      children: [
                        Text(
                          tile.count,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tile.label,
                          style: const TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
