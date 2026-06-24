import 'package:flutter/material.dart';
import 'package:jobportal/widgets/bottom_nav_bar.dart';

class InternshipPostings extends StatefulWidget {
  const InternshipPostings({super.key});

  @override
  State<InternshipPostings> createState() => _InternshipPostingsState();
}

class _InternshipPostingsState extends State<InternshipPostings> {
  int _currentIndex = 1;
  final InternshipPackage package = InternshipPackage(
    title: "Internship Featured",
    subtitle: "Perfect for hiring interns",
    price: "99",
    features: [
      "30-day listing",
      "Featured in internship section",
      "Email notifications",
      "Reach fresh talent",
    ],
  );

  void onPostInternship() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Post Internship Clicked")));
  }

  void onMaybeLater() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Maybe Later Clicked")));
  }

  void onClose() {
    Navigator.pop(context);
  }

  void onAddJob() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Add Internship Clicked")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff02141F),

      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              print("Applications");
              break;

            case 1:
              print("Postings");
              break;

            case 2:
              print("Dashboard");
              break;

            case 3:
              print("Messages");
              break;

            case 4:
              print("Settings");
              break;
          }
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
          child: Column(
            children: [
              /// HEADER CARD
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 0.8),
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xff08263A), Color(0xff031824)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.25),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(.4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.work_outline,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Job Postings",
                            style: TextStyle(
                              color: Color(0xffffd54f),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "⚜ 7 Active\nListings",
                            style: TextStyle(
                              color: Color(0xffffd54f),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: onAddJob,
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amber, width: .8),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff09334B), Color(0xff02141F)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(.25),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// CLOSE
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: onClose,
                            child: Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(.4),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "Internship Posting",
                          style: TextStyle(
                            color: Color(0xffffd54f),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Reach qualified interns quickly and affordably",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),

                        const SizedBox(height: 8),

                        /// PACKAGE BOX
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.amber),
                            gradient: LinearGradient(
                              colors: [
                                Colors.amber.withOpacity(.25),
                                Colors.black.withOpacity(.15),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "☆ Best Value",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          package.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          package.subtitle,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Text(
                                        "₹${package.price}",
                                        style: const TextStyle(
                                          color: Colors.amber,
                                          fontSize: 24,
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

                              const SizedBox(height: 6),

                              ...package.features.map(
                                (feature) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        /// POST BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton.icon(
                            onPressed: onPostInternship,
                            icon: const Icon(Icons.school),
                            label: const Text(
                              "Post Internship Now",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        /// MAYBE LATER
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: OutlinedButton(
                            onPressed: onMaybeLater,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.amber),
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

                        const SizedBox(height: 15),

                        /// SPECIAL OFFER
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber.withOpacity(.5),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: Colors.amber,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Special Offer",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  "Most affordable way to hire talented interns!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InternshipPackage {
  final String title;
  final String subtitle;
  final String price;
  final List<String> features;

  InternshipPackage({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
  });
}
