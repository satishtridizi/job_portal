import 'package:flutter/material.dart';

class PostingTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const PostingTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {"title": "All Postings", "icon": Icons.list_alt},
      {"title": "Jobs", "icon": Icons.work},
      {"title": "Internships", "icon": Icons.school},
      {"title": "Freelance", "icon": Icons.auto_awesome},
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTabChanged(index),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: selected ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.amber.withOpacity(.3)),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: Colors.amber.withOpacity(.4),
                          blurRadius: 20,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Icon(
                    tabs[index]["icon"] as IconData,
                    size: 18,
                    color: selected ? Colors.black : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    tabs[index]["title"] as String,
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
