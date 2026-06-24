import 'package:flutter/material.dart';
import 'package:jobportal/screens/create_job_posting_screen.dart';

class JobPostingHeader extends StatelessWidget {
  const JobPostingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.amber.withOpacity(.5)),
        gradient: const LinearGradient(
          colors: [Color(0xff02151f), Color(0xff002844)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.work_outline, size: 35),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Job Postings",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 240, 35),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "✧ 7 Active Listings",
                  style: TextStyle(color: Colors.amber, fontSize: 18),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CreateJobPostingScreen(),
                ),
              );
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(Icons.add, size: 36, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
