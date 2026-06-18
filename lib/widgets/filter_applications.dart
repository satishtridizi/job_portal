import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class FilterChipData {
  final String label;
  final int count;

  const FilterChipData({required this.label, required this.count});
}

class FilterApplicationsBar extends StatefulWidget {
  final ValueChanged<int>? onFilterChanged;

  const FilterApplicationsBar({super.key, this.onFilterChanged});

  @override
  State<FilterApplicationsBar> createState() => _FilterApplicationsBarState();
}

class _FilterApplicationsBarState extends State<FilterApplicationsBar> {
  int _selected = 0;

  static const List<FilterChipData> _filters = [
    FilterChipData(label: 'All', count: 10),
    FilterChipData(label: 'Jobs', count: 5),
    FilterChipData(label: 'Internships', count: 3),
    FilterChipData(label: 'Freelance', count: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: const [
              Icon(
                Icons.work_outline_rounded,
                color: AppColors.primary,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Filter Applications',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Chips row
          Row(
            children: _filters.asMap().entries.map((e) {
              final index = e.key;
              final filter = e.value;
              final isSelected = index == _selected;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() => _selected = index);
                    widget.onFilterChanged?.call(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(right: index < 3 ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.iconBg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.inputBorder,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${filter.count}',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.black
                                : AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          filter.label,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.black
                                : AppColors.textGrey,
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
