import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

enum ApplicationStatus { newApp, reviewing, shortlisted }

class ApplicantData {
  final String name;
  final String role;
  final String timeAgo;
  final ApplicationStatus status;

  const ApplicantData({
    required this.name,
    required this.role,
    required this.timeAgo,
    required this.status,
  });
}

class RecentActivityCard extends StatelessWidget {
  final VoidCallback? onViewAll;
  final ValueChanged<ApplicantData>? onApplicantTap;

  static const List<ApplicantData> _applicants = [
    ApplicantData(
      name: 'Sarah Johnson',
      role: 'Senior Software Engineer',
      timeAgo: '2 days ago',
      status: ApplicationStatus.newApp,
    ),
    ApplicantData(
      name: 'Michael Chen',
      role: 'Senior Software Engineer',
      timeAgo: '3 days ago',
      status: ApplicationStatus.reviewing,
    ),
    ApplicantData(
      name: 'Emily Rodriguez',
      role: 'Marketing Intern',
      timeAgo: '1 day ago',
      status: ApplicationStatus.shortlisted,
    ),
    ApplicantData(
      name: 'James Wilson',
      role: 'Marketing Intern',
      timeAgo: '4 days ago',
      status: ApplicationStatus.newApp,
    ),
  ];

  const RecentActivityCard({super.key, this.onViewAll, this.onApplicantTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.people_outline_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Recent Activity',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Row(
                  children: const [
                    Text(
                      'View all',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.arrow_outward_rounded,
                      color: AppColors.primary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Applicant rows
          ..._applicants.map(
            (a) => _ApplicantRow(
              applicant: a,
              onTap: () => onApplicantTap?.call(a),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplicantRow extends StatelessWidget {
  final ApplicantData applicant;
  final VoidCallback? onTap;

  const _ApplicantRow({required this.applicant, this.onTap});

  Widget _buildBadge() {
    switch (applicant.status) {
      case ApplicationStatus.newApp:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'new',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case ApplicationStatus.reviewing:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.reviewingBadge,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'reviewing',
            style: TextStyle(color: AppColors.textLight, fontSize: 12),
          ),
        );
      case ApplicationStatus.shortlisted:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.shortlistBadge,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withOpacity(0.4)),
          ),
          child: const Text(
            'shortlisted',
            style: TextStyle(color: AppColors.primary, fontSize: 12),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.iconBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Row(
          children: [
            // Avatar circle
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  applicant.name[0],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Name + role + time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    applicant.name,
                    style: const TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    applicant.role,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule_rounded,
                        color: AppColors.textGrey,
                        size: 13,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        applicant.timeAgo,
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildBadge(),
          ],
        ),
      ),
    );
  }
}
