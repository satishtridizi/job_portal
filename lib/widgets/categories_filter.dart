import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class _CategoryItem {
  final String label;
  final int count;
  const _CategoryItem(this.label, this.count);
}

class CategoriesFilter extends StatefulWidget {
  final ValueChanged<int>? onChanged;

  const CategoriesFilter({super.key, this.onChanged});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  int _selected = 0;

  static const List<_CategoryItem> _items = [
    _CategoryItem('All', 10),
    _CategoryItem('Jobs', 5),
    _CategoryItem('Internships', 3),
    _CategoryItem('Freelance', 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row
        Row(
          children: const [
            Icon(
              Icons.work_outline_rounded,
              color: AppColors.primary,
              size: 17,
            ),
            SizedBox(width: 7),
            Text(
              'Categories',
              style: TextStyle(
                color: AppColors.textWhite,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Chips
        Row(
          children: _items.asMap().entries.map((e) {
            final index = e.key;
            final item = e.value;
            final isSelected = index == _selected;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => _selected = index);
                  widget.onChanged?.call(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: index < 3 ? 8 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.cardDark,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.inputBorder,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${item.count}',
                        style: TextStyle(
                          color: isSelected ? Colors.black : AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isSelected ? Colors.black : AppColors.textGrey,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
