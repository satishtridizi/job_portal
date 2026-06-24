import 'package:flutter/material.dart';

class AIJobCreationCard extends StatelessWidget {
  final VoidCallback onGenerate;

  const AIJobCreationCard({super.key, required this.onGenerate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.amber.withOpacity(.4)),
        gradient: const LinearGradient(
          colors: [Color(0xFF02111A), Color(0xFF002D47)],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC400),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(color: Colors.amber.withOpacity(.4), blurRadius: 20),
              ],
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.black,
              size: 34,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Create with AI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Let AI help you write a professional job posting in seconds",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(244, 255, 255, 255),
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onGenerate,
              icon: const Icon(Icons.auto_awesome),
              label: const Text(
                "Make with AI",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC400),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
