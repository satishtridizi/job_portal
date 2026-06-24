import 'package:flutter/material.dart';

class JobTypeSelector extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onChanged;

  const JobTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final types = [
      {"title": "Full Time", "icon": Icons.work_outline},
      {"title": "Internship", "icon": Icons.school_outlined},
      {"title": "Freelance", "icon": Icons.auto_awesome_outlined},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Job Type",
          style: TextStyle(
            color: Color(0xFFFFE082),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: types.map((type) {
            final bool isSelected = selectedType == type["title"];

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  onChanged(type["title"] as String);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: isSelected
                        ? const Color(0xFFFFC400)
                        : const Color(0xFF02111A),
                    border: Border.all(
                      color: isSelected
                          ? Colors.amber
                          : Colors.amber.withOpacity(.25),
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.amber.withOpacity(.35),
                              blurRadius: 18,
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        type["icon"] as IconData,
                        color: isSelected ? Colors.black : Colors.white70,
                        size: 24,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        type["title"] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
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
    );
  }
}
