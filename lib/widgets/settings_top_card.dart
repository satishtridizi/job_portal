import 'package:flutter/material.dart';

class SettingsTopCard extends StatelessWidget {
  const SettingsTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff071A22),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xff8C6B00), width: .8),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(.08),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xffFFC107),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(.7),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0xffF5D66B),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Manage preferences",
                  style: TextStyle(color: Color(0xffD8B643), fontSize: 16),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xff2D2609),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: const Color(0xff8C6B00)),
            ),
            child: Row(
              children: const [
                CircleAvatar(radius: 4, backgroundColor: Color(0xffFFC107)),
                SizedBox(width: 6),
                Text(
                  "AI",
                  style: TextStyle(
                    color: Color(0xffFFC107),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
