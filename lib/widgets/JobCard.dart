import 'package:flutter/material.dart';
import 'package:jobportal/models/JobPostingModel.dart';
import 'package:jobportal/screens/job_details_screen.dart';

class JobCard extends StatelessWidget {
  final JobPostingModel job;

  const JobCard({super.key, required this.job});

  Color statusColor() {
    switch (job.status.toLowerCase()) {
      case "active":
        return Colors.blue;
      case "closed":
        return Colors.grey;
      case "draft":
        return Colors.amber;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const JobDetailsScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.amber.withOpacity(.4)),
          gradient: const LinearGradient(
            colors: [Color(0xff01111b), Color(0xff01243a)],
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(job.icon),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),

                      Text(
                        job.category,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.amber,
                          ),

                          Expanded(
                            child: Text(
                              job.location,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),

                          Text(
                            "${job.applicants}",
                            style: const TextStyle(color: Colors.white),
                          ),

                          const SizedBox(width: 4),

                          const Icon(
                            Icons.people_outline,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(job.status),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              job.employmentType,
                              style: const TextStyle(color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.more_vert, color: Colors.amber),
              ],
            ),

            const Divider(color: Colors.white24, height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job.postedAgo,
                  style: const TextStyle(color: Colors.white70),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Closes",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      job.closingDate,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
