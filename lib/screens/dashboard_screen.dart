import 'package:flutter/material.dart';
import 'package:jobportal/screens/JobPostingScreen.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/messages_screen.dart';
import 'package:jobportal/screens/settings_screen.dart';
import 'package:jobportal/widgets/bottom_nav_bar.dart';
import 'package:jobportal/widgets/filter_applications.dart';
import '../utils/app_colors.dart';
import '../widgets/welcome_card.dart';
import '../widgets/create_posting_banner.dart';
import '../widgets/stats_grid.dart';
import '../widgets/postings_overview_card.dart';
import '../widgets/recent_activity_card.dart';
import '../widgets/quick_insights_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _navIndex = 2;

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.cardDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // ── 1. Welcome Card ──
              WelcomeCard(
                companyName: 'My Company',
                onTap: () => _showSnack('Company profile tapped'),
              ),

              const SizedBox(height: 14),

              // ── 2. Create Posting Banner ──
              CreatePostingBanner(
                onTap: () => _showSnack('Create New Posting tapped'),
              ),

              const SizedBox(height: 14),

              // ── 3. Stats Grid ──
              StatsGrid(
                onActiveJobsTap: () => _showSnack('Active Jobs tapped'),
                onApplicationsTap: () => _showSnack('Applications tapped'),
                onNewTap: () => _showSnack('New (7 days) tapped'),
                onShortlistedTap: () => _showSnack('Shortlisted tapped'),
              ),

              const SizedBox(height: 14),

              // ── 4. Postings Overview ──
              PostingsOverviewCard(
                onViewAll: () => _showSnack('View all postings tapped'),
                onFullTimeTap: () => _showSnack('Full-Time tapped'),
                onInternshipsTap: () => _showSnack('Internships tapped'),
                onFreelanceTap: () => _showSnack('Freelance tapped'),
              ),

              const SizedBox(height: 14),

              // ── 5. Filter Applications ──
              FilterApplicationsBar(
                onFilterChanged: (index) {
                  const labels = ['All', 'Jobs', 'Internships', 'Freelance'];
                  _showSnack('Filter: ${labels[index]}');
                },
              ),

              const SizedBox(height: 14),

              // ── 6. Recent Activity ──
              RecentActivityCard(
                onViewAll: () => _showSnack('View all activity tapped'),
                onApplicantTap: (ApplicantData a) =>
                    _showSnack('${a.name} tapped'),
              ),

              const SizedBox(height: 14),

              // ── 7. Quick Insights ──
              QuickInsightsCard(
                onLiveJobsTap: () => _showSnack('Live Jobs tapped'),
                onPendingTap: () => _showSnack('Pending tapped'),
                onShortlistedTap: () => _showSnack('Shortlisted tapped'),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ── 8. Bottom Nav Bar ──
      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: _navIndex,
        onTap: (i) {
          if (i == _navIndex) return;

          switch (i) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AppsScreen()),
              );
              break;

            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const JobPostingScreen()),
              );
              break;

            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
              break;

            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MessagesScreen()),
              );
              break;

            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
