import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

enum AppStatus { newApp, reviewing, shortlisted, accepted, rejected }

class ApplicantCardData {
  final String name;
  final String role;
  final String email;
  final String timeAgo;
  final String jobType; // 'Job', 'Internship', 'Freelance'
  final int matchScore;
  final AppStatus status;

  const ApplicantCardData({
    required this.name,
    required this.role,
    required this.email,
    required this.timeAgo,
    required this.jobType,
    required this.matchScore,
    required this.status,
  });
}

class ApplicantCard extends StatelessWidget {
  final ApplicantCardData data;
  final VoidCallback? onTap;
  final VoidCallback? onStatusTap;

  const ApplicantCard({
    super.key,
    required this.data,
    this.onTap,
    this.onStatusTap,
  });

  Widget _buildStatusBadge() {
    switch (data.status) {
      case AppStatus.newApp:
        return GestureDetector(
          onTap: onStatusTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.auto_awesome, color: Colors.black, size: 13),
                SizedBox(width: 4),
                Text(
                  'new',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      case AppStatus.reviewing:
        return GestureDetector(
          onTap: onStatusTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2E3A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.inputBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.hub_outlined, color: AppColors.textLight, size: 13),
                SizedBox(width: 4),
                Text(
                  'reviewing',
                  style: TextStyle(color: AppColors.textLight, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      case AppStatus.shortlisted:
        return GestureDetector(
          onTap: onStatusTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF0D2E3A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withOpacity(0.4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.bolt_rounded, color: AppColors.primary, size: 13),
                SizedBox(width: 4),
                Text(
                  'shortlisted',
                  style: TextStyle(color: AppColors.primary, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      case AppStatus.accepted:
        return GestureDetector(
          onTap: onStatusTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF0D3020),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green.withOpacity(0.4)),
            ),
            child: const Text(
              'accepted',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
          ),
        );
      case AppStatus.rejected:
        return GestureDetector(
          onTap: onStatusTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF3A0D0D),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
            ),
            child: const Text(
              'rejected',
              style: TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
        );
    }
  }

  Widget _buildJobTypeBadge() {
    Color bg;
    Color text;
    switch (data.jobType.toLowerCase()) {
      case 'internship':
        bg = const Color(0xFF1E2A10);
        text = const Color(0xFFAACC44);
        break;
      case 'freelance':
        bg = const Color(0xFF2A1E10);
        text = const Color(0xFFCCAA44);
        break;
      default:
        bg = const Color(0xFF10202A);
        text = AppColors.textLight;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: text.withOpacity(0.3)),
      ),
      child: Text(
        data.jobType,
        style: TextStyle(
          color: text,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: avatar + name/role + match score
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.35),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      data.name[0],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Name + role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        data.role,
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                // Match score badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.inputBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        color: AppColors.primary,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${data.matchScore}%',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Row 2: job type badge + email
            Row(
              children: [
                _buildJobTypeBadge(),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data.email,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Row 3: time ago + status badge
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.textGrey,
                  size: 13,
                ),
                const SizedBox(width: 5),
                Text(
                  data.timeAgo,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                _buildStatusBadge(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
