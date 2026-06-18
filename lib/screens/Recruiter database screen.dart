import 'package:flutter/material.dart';
import 'package:jobportal/utils/app_colors.dart';
import 'package:jobportal/widgets/featuretile.dart';
import 'package:jobportal/widgets/pricing_plans_sheet.dart';

import '../widgets/Recruiter shared.dart';
import 'Recruiter database select price screen.dart';

// ── Recruiter Database Screen ──────────────────────────────────
// First screen: introduces the feature and lets the user pick a plan.
// Tapping "Select a Plan" (only enabled once a plan is chosen) pushes
// RecruiterDatabaseSelectPriceScreen with that plan pre-selected.
class RecruiterDatabaseScreen extends StatefulWidget {
  const RecruiterDatabaseScreen({super.key});

  @override
  State<RecruiterDatabaseScreen> createState() =>
      _RecruiterDatabaseScreenState();
}

class _RecruiterDatabaseScreenState extends State<RecruiterDatabaseScreen> {
  PlanData? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: const Text('Recruiter Database'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.35),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.12),
                blurRadius: 28,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            children: [
              // ── Icon ──
              Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.storage_rounded,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // ── Title ──
              const Center(
                child: Text(
                  'Recruiter Database',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  'Unlock access to our exclusive talent pool',
                  style: TextStyle(color: AppColors.textGrey, fontSize: 12.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 14),

              // ── Feature Rows ──
              FeatureTile(
                icon: Icons.storage,
                title: '10,000+ verified candidates',
              ),
              FeatureTile(
                icon: Icons.psychology_alt,
                title: 'AI-powered candidate matching',
              ),
              FeatureTile(
                icon: Icons.search,
                title: 'Advanced search & filtering',
              ),
              FeatureTile(
                icon: Icons.contact_phone,
                title: 'Direct contact information',
              ),
              FeatureTile(icon: Icons.insights, title: 'Analytics & insights'),
              const SizedBox(height: 14),

              // ── Plan Cards ──
              ...kRecruiterPlans.map(
                (plan) => PlanCard(
                  plan: plan,
                  isSelected: _selected == plan,
                  onTap: () => setState(() => _selected = plan),
                ),
              ),
              const SizedBox(height: 14),

              // ── Select a Plan CTA ──
              GestureDetector(
                onTap: _selected != null
                    ? () {
                        // subscription action
                        print("Subscribed to ${_selected!.title}");
                      }
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _selected != null
                        ? AppColors.primary
                        : AppColors.btnDisabled,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.workspace_premium_rounded,
                        color: _selected != null
                            ? Colors.black
                            : AppColors.textGrey,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selected == null
                            ? 'Select a Plan'
                            : 'Subscribe to ${_selected!.shortName} Plan',
                        style: TextStyle(
                          color: _selected != null
                              ? Colors.black
                              : AppColors.textGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // ── Maybe Later ──
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.cardBorder, width: 1),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Maybe Later',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
