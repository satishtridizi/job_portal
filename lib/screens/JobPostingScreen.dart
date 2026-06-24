import 'package:flutter/material.dart';
import 'package:jobportal/Data/jobPostings_data.dart';
import 'package:jobportal/screens/ApplicationDetailsScreen.dart';
import 'package:jobportal/screens/QuickRecruitDialog.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/dashboard_screen.dart';
import 'package:jobportal/screens/internship_postings.dart';
import 'package:jobportal/screens/job_postings_app.dart';

import 'package:jobportal/widgets/JobCard.dart';
import 'package:jobportal/widgets/JobPostingHeader.dart';
import 'package:jobportal/widgets/JobSearchBar.dart';
import 'package:jobportal/widgets/PostingTabs.dart';
import 'package:jobportal/widgets/SmartFilterButton.dart';
import 'package:jobportal/widgets/bottom_nav_bar.dart';

import '../widgets/PlanCard.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  int selectedTab = 0;
  int selectedFilter = 0;
  bool showFilters = false;
  @override
  Widget build(BuildContext context) {
    final filteredJobs = selectedTab == 0
        ? jobPostings
        : selectedTab == 1
        ? jobPostings.where((e) => e.category == "Engineering").toList()
        : selectedTab == 2
        ? jobPostings
              .where((e) => e.title.toLowerCase().contains("intern"))
              .toList()
        : jobPostings.where((e) => e.employmentType == "Freelance").toList();
    final statusFilteredJobs = selectedFilter == 0
        ? filteredJobs
        : selectedFilter == 1
        ? filteredJobs
              .where((job) => job.status.toLowerCase() == "active")
              .toList()
        : selectedFilter == 2
        ? filteredJobs
              .where((job) => job.status.toLowerCase() == "closed")
              .toList()
        : filteredJobs
              .where((job) => job.status.toLowerCase() == "draft")
              .toList();
    return Scaffold(
      backgroundColor: const Color(0xff00111A),

      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: 1, // Postings selected
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AppsScreen()),
              );
              break;

            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JobPostingScreen()),
              );
              break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
              break;

            case 3:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => const MessagesScreen()),
              // );
              break;

            case 4:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => const SettingsScreen()),
              // );
              break;
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF010B12), Color(0xFF00253D), Color(0xFF010B12)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const JobPostingHeader(),

              const SizedBox(height: 24),

              PlanCard(
                icon: Icons.rocket_launch,
                title: "Quick Recruit",
                badge: "Fast",
                subtitle: "Hire candidates 3x faster with AI boost",
                price: "₹2,499",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuickRecruitDialog(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              PlanCard(
                icon: Icons.work,
                title: "Job Posting Plans",
                badge: "Premium",
                subtitle: "Boost visibility & reach more candidates",
                price: "₹199",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const JobPostingsApp()),
                  );
                },
              ),

              const SizedBox(height: 16),

              PlanCard(
                icon: Icons.school,
                title: "Internship Posting",
                badge: "Featured",
                subtitle: "Reach qualified interns quickly",
                price: "₹99",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InternshipPostings(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              PostingTabs(
                selectedIndex: selectedTab,
                onTabChanged: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),

              const SizedBox(height: 16),

              const JobSearchBar(),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  setState(() {
                    showFilters = !showFilters;
                  });
                },
                child: SmartFilterButton(isExpanded: showFilters),
              ),

              const SizedBox(height: 16),

              if (showFilters)
                StatusFilterBar(
                  selectedIndex: selectedFilter,
                  onChanged: (index) {
                    setState(() {
                      selectedFilter = index;
                    });
                  },
                ),

              if (showFilters) const SizedBox(height: 20),
              const SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: statusFilteredJobs.length,
                itemBuilder: (context, index) {
                  return JobCard(job: statusFilteredJobs[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
