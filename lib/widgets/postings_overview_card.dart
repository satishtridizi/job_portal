import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PostingOverviewItem {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final int count;
  final int total;

  const PostingOverviewItem({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.total,
  });
}

class PostingsOverviewCard extends StatelessWidget {
  final VoidCallback? onViewAll;
  final VoidCallback? onFullTimeTap;
  final VoidCallback? onInternshipsTap;
  final VoidCallback? onFreelanceTap;

  const PostingsOverviewCard({
    super.key,
    this.onViewAll,
    this.onFullTimeTap,
    this.onInternshipsTap,
    this.onFreelanceTap,
  });

  static const List<PostingOverviewItem> _items = [
    PostingOverviewItem(
      icon: Icons.work_rounded,
      iconBg: Color(0xFF1A2E20),
      title: 'Full-Time',
      subtitle: 'Permanent roles',
      count: 2,
      total: 5,
    ),
    PostingOverviewItem(
      icon: Icons.school_rounded,
      iconBg: Color(0xFF2A2A10),
      title: 'Internships',
      subtitle: 'Learning opportunities',
      count: 2,
      total: 5,
    ),
    PostingOverviewItem(
      icon: Icons.auto_awesome,
      iconBg: Color(0xFF1E1E2A),
      title: 'Freelance',
      subtitle: 'Project-based',
      count: 1,
      total: 5,
    ),
  ];

  List<VoidCallback?> get _callbacks => [
    onFullTimeTap,
    onInternshipsTap,
    onFreelanceTap,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.inputBorder),
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
                  Icons.work_outline_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Postings Overview',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.inputBorder),
                  ),
                  child: const Text(
                    '5 total',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Items
          ..._items.asMap().entries.map((e) {
            final item = e.value;
            final cb = _callbacks[e.key];
            return _PostingRow(item: item, onTap: cb);
          }),
        ],
      ),
    );
  }
}

class _PostingRow extends StatelessWidget {
  final PostingOverviewItem item;
  final VoidCallback? onTap;

  const _PostingRow({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final progress = item.total > 0 ? item.count / item.total : 0.0;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: item.iconBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.inputBorder),
                  ),
                  child: Icon(item.icon, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${item.count}',
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.iconBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
