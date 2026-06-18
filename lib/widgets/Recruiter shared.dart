import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'pricing_plans_sheet.dart';

const List<(IconData, String)> kRecruiterFeatures = [
  (Icons.people_alt_outlined, 'Access thousands of verified candidates'),
  (Icons.search, 'Advanced search and AI filters'),
  (Icons.contact_page_outlined, 'Direct recruiter access'),
  (Icons.analytics_outlined, 'Hiring analytics dashboard'),
];

final List<PlanData> kRecruiterPlans = [
  const PlanData(
    title: 'Recruiter Database',
    shortName: 'Basic',
    subtitle: 'Access verified candidates',
    price: '₹2,999',
    features: [
      '5,000 candidate profiles',
      'Basic search filters',
      'Email support',
    ],
  ),

  const PlanData(
    title: 'Recruiter Database Pro',
    shortName: 'Pro',
    subtitle: 'Unlimited access & features',
    price: '₹3,999',
    features: [
      '10,000+ candidate profiles',
      'Advanced AI-powered filters',
      'Direct contact information',
      'Priority support',
      'Analytics dashboard',
    ],
    isRecommended: true,
  ),
];

class FeatureRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureRow({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.textWhite, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final PlanData plan;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if (plan.isRecommended)
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff051a29),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected ? Colors.amber : Colors.amber.withOpacity(.2),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            plan.subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          plan.price,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'per month',
                          style: TextStyle(color: Colors.white54, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                ...plan.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
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
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
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
        ],
      ),
    );
  }
}
