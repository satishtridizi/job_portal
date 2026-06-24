import 'package:flutter/material.dart';

// ── Palette ────────────────────────────────────────────────────
class _C {
  static const bg = Color(0xFF0B1A2C);
  static const card = Color(0xFF112236);
  static const cardBorder = Color(0xFF1E3A55);
  static const primary = Color(0xFFFFC107);
  static const textWhite = Color(0xFFFFFFFF);
  static const textGrey = Color(0xFF8CA0B3);
  static const btnDisabled = Color(0xFF1C3347);
}

// ── Plan Model ────────────────────────────────────────────────
class PlanData {
  final String title;
  final String shortName;
  final String subtitle;
  final String price;
  final List<String> features;
  final bool isRecommended;

  const PlanData({
    required this.title,
    required this.shortName,
    required this.subtitle,
    required this.price,
    required this.features,
    this.isRecommended = false,
  });
}

// ── Static plan definitions ───────────────────────────────────
const _plans = [
  PlanData(
    title: 'Recruiter Database',
    subtitle: 'Access verified candidates',
    price: '₹2,999',
    features: [
      '5,000 candidate profiles',
      'Basic search filters',
      'Email support',
    ],
    shortName: '',
  ),
  PlanData(
    title: 'Recruiter Database Pro',
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
    shortName: '',
  ),
];

// ── Public API ────────────────────────────────────────────────

/// Show the pricing plans bottom sheet.
Future<void> showPricingPlansSheet(
  BuildContext context, {
  void Function(PlanData plan)? onPlanSelected,
  VoidCallback? onMaybeLater,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => PricingPlansSheet(
      onPlanSelected: onPlanSelected,
      onMaybeLater: onMaybeLater,
    ),
  );
}

// ── Sheet Widget ──────────────────────────────────────────────
class PricingPlansSheet extends StatefulWidget {
  final void Function(PlanData plan)? onPlanSelected;
  final VoidCallback? onMaybeLater;

  const PricingPlansSheet({super.key, this.onPlanSelected, this.onMaybeLater});

  @override
  State<PricingPlansSheet> createState() => _PricingPlansSheetState();
}

class _PricingPlansSheetState extends State<PricingPlansSheet> {
  PlanData? _selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      decoration: BoxDecoration(
        color: _C.bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _C.primary.withOpacity(0.35), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: _C.primary.withOpacity(0.10),
            blurRadius: 28,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Plan cards ──
          ..._plans.map(
            (plan) => _PlanCard(
              plan: plan,
              isSelected: _selected == plan,
              onTap: () => setState(() => _selected = plan),
            ),
          ),

          const SizedBox(height: 20),

          // ── Select a Plan CTA ──
          GestureDetector(
            onTap: _selected != null
                ? () => widget.onPlanSelected?.call(_selected!)
                : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                color: _selected != null ? _C.primary : _C.btnDisabled,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.workspace_premium_rounded,
                    color: _selected != null ? Colors.black : _C.textGrey,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Select a Plan',
                    style: TextStyle(
                      color: const Color(0xFF8E8E8E),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Maybe Later ──
          GestureDetector(
            onTap: () {
              widget.onMaybeLater?.call();
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                color: _C.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _C.cardBorder, width: 1),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Maybe Later',
                style: TextStyle(
                  color: _C.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Plan Card ────────────────────────────────────────────────
class _PlanCard extends StatelessWidget {
  final PlanData plan;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlanCard({
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
          // "Recommended" badge sits above the card
          if (plan.isRecommended)
            Transform.translate(
              offset: const Offset(0, 8),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _C.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Recommended',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Card body
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _C.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? _C.primary : _C.cardBorder,
                width: isSelected ? 1.5 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: _C.primary.withOpacity(0.15),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title row
                      Row(
                        children: [
                          Text(
                            plan.title,
                            style: const TextStyle(
                              color: _C.textWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (plan.isRecommended) ...[
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.workspace_premium_rounded,
                              color: _C.primary,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        plan.subtitle,
                        style: const TextStyle(
                          color: _C.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Features
                      ...plan.features.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_border_rounded,
                                color: _C.primary,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                f,
                                style: const TextStyle(
                                  color: _C.textGrey,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right: price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      plan.price,
                      style: const TextStyle(
                        color: _C.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'per month',
                      style: TextStyle(color: _C.textGrey, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
