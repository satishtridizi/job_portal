import 'package:flutter/material.dart';
import 'package:jobportal/models/QuickRecruitFeature.dart';

final List<QuickRecruitFeature> features = [
  QuickRecruitFeature(
    icon: Icons.flash_on_rounded,
    title: "Priority listing on top positions",
  ),
  QuickRecruitFeature(
    icon: Icons.psychology_alt,
    title: "AI-powered candidate matching",
  ),
  QuickRecruitFeature(
    icon: Icons.track_changes,
    title: "Advanced targeting & filters",
  ),
  QuickRecruitFeature(
    icon: Icons.notifications_active,
    title: "Instant application notifications",
  ),
];

final List<QuickRecruitPlan> plans = [
  QuickRecruitPlan(
    name: "Quick Recruit",
    subtitle: "Fast-track your hiring",
    price: "₹2,499",
    benefits: [
      "7-day priority listing",
      "Basic AI matching",
      "Email notifications",
    ],
  ),
  QuickRecruitPlan(
    name: "Quick Recruit Pro",
    subtitle: "Maximum visibility & reach",
    price: "₹3,499",
    isPopular: true,
    benefits: [
      "14-day priority listing",
      "Advanced AI matching",
      "Real-time notifications",
      "Featured in search results",
      "Dedicated support",
    ],
  ),
];
