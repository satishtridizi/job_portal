import 'package:flutter/material.dart';

class JobPostingModel {
  final String id;
  final String title;
  final String category;
  final String location;
  final int applicants;
  final String status;
  final String employmentType;
  final String postedAgo;
  final String closingDate;
  final IconData icon;
  final bool highlighted;

  JobPostingModel({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.applicants,
    required this.status,
    required this.employmentType,
    required this.postedAgo,
    required this.closingDate,
    required this.icon,
    this.highlighted = false,
  });
}
