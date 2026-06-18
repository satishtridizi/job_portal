import 'package:flutter/material.dart';
import 'package:jobportal/widgets/pricing_plans_sheet.dart';
import '../utils/app_colors.dart';
import '../widgets/ai_talent_hub_card.dart';
import '../widgets/recruiter_database_card.dart';
import '../widgets/ai_search_bar.dart';
import '../widgets/categories_filter.dart';
import '../widgets/applicant_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/status_filters_section.dart';
import 'Recruiter database screen.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key});

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  int _navIndex = 0;
  String _searchQuery = '';
  int _categoryIndex = 0;
  String _statusFilter = 'All';

  static const List<ApplicantCardData> _allApplicants = [
    ApplicantCardData(
      name: 'Sarah Johnson',
      role: 'Senior Software Engineer',
      email: 'sarah.johnson@email.com',
      timeAgo: '2 days ago',
      jobType: 'Job',
      matchScore: 94,
      status: AppStatus.newApp,
    ),
    ApplicantCardData(
      name: 'Michael Chen',
      role: 'Senior Software Engineer',
      email: 'michael.chen@email.com',
      timeAgo: '3 days ago',
      jobType: 'Job',
      matchScore: 90,
      status: AppStatus.reviewing,
    ),
    ApplicantCardData(
      name: 'Emily Rodriguez',
      role: 'Marketing Intern',
      email: 'emily.rodriguez@university.edu',
      timeAgo: '1 day ago',
      jobType: 'Internship',
      matchScore: 82,
      status: AppStatus.shortlisted,
    ),
    ApplicantCardData(
      name: 'James Wilson',
      role: 'Marketing Intern',
      email: 'james.wilson@university.edu',
      timeAgo: '4 days ago',
      jobType: 'Internship',
      matchScore: 86,
      status: AppStatus.newApp,
    ),
    ApplicantCardData(
      name: 'Aisha Patel',
      role: 'UI/UX Designer',
      email: 'aisha.patel@studio.com',
      timeAgo: '5 days ago',
      jobType: 'Freelance',
      matchScore: 78,
      status: AppStatus.accepted,
    ),
    ApplicantCardData(
      name: 'David Kim',
      role: 'Backend Developer',
      email: 'david.kim@dev.io',
      timeAgo: '6 days ago',
      jobType: 'Job',
      matchScore: 71,
      status: AppStatus.rejected,
    ),
  ];

  // ── Status counts ─────────────────────────────────────────────
  Map<String, int> get _statusCounts {
    final map = <String, int>{
      'All': _allApplicants.length,
      'New': 0,
      'Reviewing': 0,
      'Shortlisted': 0,
      'Accepted': 0,
      'Rejected': 0,
    };
    for (final a in _allApplicants) {
      switch (a.status) {
        case AppStatus.newApp:
          map['New'] = map['New']! + 1;
          break;
        case AppStatus.reviewing:
          map['Reviewing'] = map['Reviewing']! + 1;
          break;
        case AppStatus.shortlisted:
          map['Shortlisted'] = map['Shortlisted']! + 1;
          break;
        case AppStatus.accepted:
          map['Accepted'] = map['Accepted']! + 1;
          break;
        case AppStatus.rejected:
          map['Rejected'] = map['Rejected']! + 1;
          break;
      }
    }
    return map;
  }

  // ── Filtered list ─────────────────────────────────────────────
  List<ApplicantCardData> get _filtered {
    return _allApplicants.where((a) {
      if (_categoryIndex == 1 && a.jobType != 'Job') return false;
      if (_categoryIndex == 2 && a.jobType != 'Internship') return false;
      if (_categoryIndex == 3 && a.jobType != 'Freelance') return false;

      if (_statusFilter != 'All') {
        final statusMap = {
          'New': AppStatus.newApp,
          'Reviewing': AppStatus.reviewing,
          'Shortlisted': AppStatus.shortlisted,
          'Accepted': AppStatus.accepted,
          'Rejected': AppStatus.rejected,
        };
        if (a.status != statusMap[_statusFilter]) return false;
      }

      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        return a.name.toLowerCase().contains(q) ||
            a.role.toLowerCase().contains(q) ||
            a.email.toLowerCase().contains(q);
      }
      return true;
    }).toList();
  }

  // ── Snackbar helper ───────────────────────────────────────────
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

  // ── Sheet: Pricing Plans ──────────────────────────────────────
  void _openPricingPlansSheet() {
    showPricingPlansSheet(
      context,
      onPlanSelected: (plan) {
        Navigator.of(context).pop();
        _showSnack('Subscribed to ${plan.title}');
      },
      onMaybeLater: () {
        _showSnack('Maybe later — come back anytime!');
      },
    );
  }

  void _openRecruiterDatabaseScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RecruiterDatabaseScreen()),
    );

    if (result != null) {
      _showSnack('Subscribed to ${result.title}');
    }
  }

  // ── Build ─────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── 1. AI Talent Hub Card ──
              AiTalentHubCard(
                activeCandidates: _allApplicants.length,
                onBoostTap: () => _showSnack('Boost tapped'),
                onCardTap: () => _showSnack('AI Talent Hub tapped'),
              ),

              const SizedBox(height: 12),

              // ── 2. Recruiter Database Card ──
              // Both onTap (card body) and onLockTap (lock icon) open Sheet 1.
              RecruiterDatabaseCard(
                onTap: _openRecruiterDatabaseScreen,
                onLockTap: _openRecruiterDatabaseScreen,
              ),

              const SizedBox(height: 12),

              // ── 3. AI Search Bar ──
              AiSearchBar(
                onChanged: (val) => setState(() => _searchQuery = val),
              ),

              const SizedBox(height: 16),

              // ── 4. Categories Filter ──
              CategoriesFilter(
                onChanged: (i) => setState(() => _categoryIndex = i),
              ),

              const SizedBox(height: 16),

              // ── 5. Status Filters ──
              StatusFiltersSection(
                statusCounts: _statusCounts,
                onStatusChanged: (s) => setState(() => _statusFilter = s),
              ),

              const SizedBox(height: 16),

              // ── 6. Applicant Cards ──
              if (filtered.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.search_off_rounded,
                        color: AppColors.textGrey,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No candidates found',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) {
                    final a = filtered[i];
                    return ApplicantCard(
                      data: a,
                      onTap: () => _showSnack('${a.name} tapped'),
                      onStatusTap: () =>
                          _showSnack('Change status for ${a.name}'),
                    );
                  },
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ── Bottom Nav Bar ──
      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() => _navIndex = i);
          const labels = [
            'Apps',
            'Postings',
            'Dashboard',
            'Messages',
            'Settings',
          ];
          _showSnack('${labels[i]} tapped');
        },
      ),
    );
  }
}
