import 'package:flutter/material.dart';
import 'package:jobportal/utils/app_colors.dart';
import 'package:jobportal/widgets/pricing_plans_sheet.dart';

import '../widgets/Recruiter shared.dart' hide AppColors;

class RecruiterDatabaseSelectPriceScreen extends StatefulWidget {
  final PlanData initialPlan;

  const RecruiterDatabaseSelectPriceScreen({
    super.key,
    required this.initialPlan,
  });

  @override
  State<RecruiterDatabaseSelectPriceScreen> createState() =>
      _RecruiterDatabaseSelectPriceScreenState();
}

class _RecruiterDatabaseSelectPriceScreenState
    extends State<RecruiterDatabaseSelectPriceScreen> {
  late PlanData _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialPlan;
  }

  // Closes this screen AND the Recruiter Database screen below it,
  // landing back on whatever pushed Recruiter Database (Apps screen).
  void _backToAppsScreen([PlanData? result]) {
    final navigator = Navigator.of(context);
    navigator.pop(result); // close Select Price screen
    navigator.pop(result); // close Recruiter Database screen
  }

  void _subscribe() {
    // TODO: hook up real payment / checkout flow here.
    _backToAppsScreen(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: const Text('Recruiter Database Select price'),
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
              ...kRecruiterFeatures.map(
                (f) => FeatureRow(icon: f.$1, label: f.$2),
              ),
              const SizedBox(height: 14),

              ...kRecruiterPlans.map(
                (plan) => PlanCard(
                  plan: plan,
                  isSelected: _selected == plan,
                  onTap: () => setState(() => _selected = plan),
                ),
              ),
              const SizedBox(height: 14),

              GestureDetector(
                onTap: _subscribe,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Subscribe to ${_selected.title} Plan',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () => _backToAppsScreen(),
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
              const SizedBox(height: 14),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 11.5),
                    children: [
                      TextSpan(
                        text: 'No commitment: ',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Cancel anytime with 30-day money-back guarantee',
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                    ],
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
