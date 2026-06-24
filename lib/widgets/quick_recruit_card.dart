import 'package:flutter/material.dart';

class QuickRecruitCard extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const QuickRecruitCard({
    super.key,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.amber.withOpacity(.4)),
        gradient: const LinearGradient(
          colors: [Color(0xFF02111A), Color(0xFF002D47)],
        ),
        boxShadow: [
          BoxShadow(color: Colors.amber.withOpacity(.08), blurRadius: 15),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC400),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.amber.withOpacity(.35), blurRadius: 15),
              ],
            ),
            child: const Icon(
              Icons.rocket_launch,
              color: Colors.black,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Quick Recruit",
                  style: TextStyle(
                    color: Color(0xFFFFE082),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Hire candidates up to 3x faster using AI-powered matching and promotion.",
                  style: TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),

          Switch(
            value: enabled,
            activeColor: Colors.amber,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
