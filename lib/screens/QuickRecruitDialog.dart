import 'package:flutter/material.dart';
import 'package:jobportal/Data/features_data.dart';
import 'package:jobportal/models/QuickRecruitFeature.dart';

class QuickRecruitDialog extends StatefulWidget {
  const QuickRecruitDialog({super.key});

  @override
  State<QuickRecruitDialog> createState() => _QuickRecruitDialogState();
}

class _QuickRecruitDialogState extends State<QuickRecruitDialog> {
  int? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(
              top: 40, // increase/decrease this value
              left: 16,
              right: 16,
              bottom: 16,
            ),

            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber, width: 1),
              gradient: const LinearGradient(
                colors: [Color(0xff03263E), Color(0xff00141F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Close Button
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// Logo
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(.35),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.rocket_launch,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Quick Recruit",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Hire top talent 3x faster with AI-powered recruitment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Features
                  ...List.generate(
                    features.length,
                    (index) => _featureTile(features[index]),
                  ),

                  const SizedBox(height: 18),

                  /// Plans
                  ...List.generate(plans.length, (index) => _planCard(index)),

                  const SizedBox(height: 20),

                  /// Select Plan
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: selectedPlan == null
                          ? null
                          : () {
                              final plan = plans[selectedPlan!];

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${plan.name} Selected"),
                                ),
                              );
                            },
                      icon: const Icon(Icons.rocket_launch),
                      label: const Text("Select a Plan"),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Later
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                      ),
                      child: const Text(
                        "Maybe Later",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.amber.withOpacity(.35)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(.08),
                          Colors.amber.withOpacity(.08),
                        ],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_time_outlined,
                          color: Colors.amber,
                          size: 22,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Limited Time:",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 2),

                              Text(
                                "Get 20% more applications with Quick Recruit plans!",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.75),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  Widget _featureTile(QuickRecruitFeature feature) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(.15)),
      ),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(feature.icon, size: 18, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _planCard(int index) {
    final plan = plans[index];
    final selected = selectedPlan == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = index;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? Colors.amber : Colors.amber.withOpacity(.2),
                width: selected ? 2 : 1,
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
                            plan.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            plan.subtitle,
                            style: const TextStyle(color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      plan.price,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...plan.benefits.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            e,
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

          if (plan.isPopular)
            Positioned(
              top: -10,
              left: 80,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "👑 Most Popular",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
