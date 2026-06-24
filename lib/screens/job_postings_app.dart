import 'package:flutter/material.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/dashboard_screen.dart';

class JobPostingsApp extends StatefulWidget {
  const JobPostingsApp({super.key});

  @override
  State<JobPostingsApp> createState() => _JobPostingsAppState();
}

class _JobPostingsAppState extends State<JobPostingsApp> {
  int? selectedPlan;
  int _currentIndex = 1;
  final List<JobPlan> plans = [
    JobPlan(
      title: "Job Elite",
      subtitle: "Enhanced visibility",
      price: 199,
      features: ["30-day listing", "Featured in search", "Email notifications"],
    ),
    JobPlan(
      title: "Job Pro",
      subtitle: "Maximum reach",
      price: 299,
      recommended: true,
      features: [
        "45-day listing",
        "Top featured placement",
        "Highlighted in results",
        "Priority support",
      ],
    ),
  ];

  void selectPlan() {
    if (selectedPlan == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a plan")));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${plans[selectedPlan!].title} Selected")),
    );
  }

  void maybeLater() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff02131F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _buildHeaderCard(),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xff031D2C),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.amber.shade700, width: 0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.18),
                      blurRadius: 25,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(.45),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.work_outline,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Job Posting Plans",
                      style: TextStyle(
                        color: Color(0xffffdf82),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Boost your job visibility and attract top talent",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    const SizedBox(height: 12),

                    ...List.generate(
                      plans.length,
                      (index) => _buildPlanCard(plans[index], index),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton.icon(
                        onPressed: selectPlan,
                        icon: const Icon(Icons.work_outline),
                        label: const Text("Select a Plan"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedPlan == null
                              ? Colors.grey.shade700
                              : Colors.amber,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: OutlinedButton(
                        onPressed: maybeLater,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.amber.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Maybe Later",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff06243A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.amber.shade700, width: .7),
      ),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.work_outline, color: Colors.black),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Postings",
                  style: TextStyle(
                    color: Color(0xffffdf82),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "☆ 7 Active\nListings",
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              debugPrint("Add Job Clicked");
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(JobPlan plan, int index) {
    bool isSelected = selectedPlan == index;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedPlan = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xff021923),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? Colors.amber : Colors.amber.withOpacity(.5),
                width: 1.2,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plan.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            plan.subtitle,
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "₹${plan.price}",
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "per posting",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                ...plan.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (plan.recommended)
          Positioned(
            top: -8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "👑 Recommended",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xff03243A),
        border: Border(top: BorderSide(color: Color(0x33FFC107))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.apps_outlined, "Apps", 0),
          _navItem(Icons.work_outline, "Postings", 1),
          _navItem(Icons.dashboard_outlined, "Dashboard", 2),
          _navItem(Icons.chat_bubble_outline, "Messages", 3),
          _navItem(Icons.settings_outlined, "Settings", 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool selected = _currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AppsScreen()),
            );
            break;

          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const JobPostingsApp()),
            );
            break;

          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
            );
            break;

          case 3:
            // Messages Screen
            break;

          case 4:
            // Settings Screen
            break;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selected)
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),

          Icon(icon, size: 20, color: selected ? Colors.amber : Colors.white70),

          const SizedBox(height: 2),

          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.amber : Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class JobPlan {
  final String title;
  final String subtitle;
  final int price;
  final bool recommended;
  final List<String> features;

  JobPlan({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    this.recommended = false,
  });
}
