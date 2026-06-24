import 'package:flutter/material.dart';

class SmartFilterButton extends StatelessWidget {
  final bool isExpanded;

  const SmartFilterButton({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber.withOpacity(.4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.filter_alt_outlined, color: Colors.amber),
            const SizedBox(width: 8),
            const Text("Smart Filters", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 6),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusFilterBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const StatusFilterBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ["All", "Active", "Closed", "Draft"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.tune, color: Colors.amber, size: 18),
            SizedBox(width: 8),
            Text(
              "Filter by Status",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final selected = index == selectedIndex;

              return GestureDetector(
                onTap: () => onChanged(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFFFC400)
                        : const Color(0xFF0B2B3E),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.amber.withOpacity(.25)),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: Colors.amber.withOpacity(.5),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
