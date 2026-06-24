import 'package:flutter/material.dart';

class QuickRecruitFeature {
  final IconData icon;
  final String title;

  QuickRecruitFeature({required this.icon, required this.title});
}

class QuickRecruitPlan {
  final String name;
  final String subtitle;
  final String price;
  final bool isPopular;
  final List<String> benefits;

  QuickRecruitPlan({
    required this.name,
    required this.subtitle,
    required this.price,
    this.isPopular = false,
    required this.benefits,
  });
}
