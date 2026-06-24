import 'package:flutter/material.dart';

class PremiumPlanCard extends StatelessWidget {
  final String selectedPlan;
  final ValueChanged<String> onPlanSelected;

  const PremiumPlanCard({
    super.key,
    required this.selectedPlan,
    required this.onPlanSelected,
  });

  @override
  Widget build(BuildContext context) {
    final plans = [
      {
        "id": "elite",
        "title": "Job Elite",
        "price": "₹199",
        "badge": "Popular",
        "description": "Featured placement and increased visibility",
        "icon": Icons.workspace_premium,
      },
      {
        "id": "pro",
        "title": "Job Pro",
        "price": "₹299",
        "badge": "Best Value",
        "description": "Maximum reach with premium promotion",
        "icon": Icons.auto_awesome,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Premium Plans",
          style: TextStyle(
            color: Color(0xFFFFE082),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        ...plans.map((plan) {
          final bool isSelected = selectedPlan == plan["id"];

          return GestureDetector(
            onTap: () {
              onPlanSelected(plan["id"] as String);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isSelected
                      ? Colors.amber
                      : Colors.amber.withOpacity(.25),
                  width: isSelected ? 2 : 1,
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFF02111A), Color(0xFF002D47)],
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.amber.withOpacity(.25),
                          blurRadius: 20,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC400),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(plan["icon"] as IconData, color: Colors.black),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              plan["title"] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(width: 8),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                plan["badge"] as String,
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Text(
                          plan["description"] as String,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        plan["price"] as String,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Icon(
                        isSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
