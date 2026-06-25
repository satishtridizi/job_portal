import 'package:flutter/material.dart';

class CompanyModel {
  final String companyName;
  final String industry;
  final String description;
  final String teamSize;
  final String location;
  final IconData companyIcon;
  final Color companyIconColor;
  final Color companyIconBackground;

  const CompanyModel({
    required this.companyName,
    required this.industry,
    required this.description,
    required this.teamSize,
    required this.location,
    this.companyIcon = Icons.business,
    this.companyIconColor = Colors.black,
    this.companyIconBackground = const Color(0xFFFFC107),
  });

  /// Create object from API response
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      companyName: json['companyName'] ?? '',
      industry: json['industry'] ?? '',
      description: json['description'] ?? '',
      teamSize: json['teamSize'] ?? '',
      location: json['location'] ?? '',
    );
  }

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'industry': industry,
      'description': description,
      'teamSize': teamSize,
      'location': location,
    };
  }

  /// Create a copy with updated values
  CompanyModel copyWith({
    String? companyName,
    String? industry,
    String? description,
    String? teamSize,
    String? location,
    IconData? companyIcon,
    Color? companyIconColor,
    Color? companyIconBackground,
  }) {
    return CompanyModel(
      companyName: companyName ?? this.companyName,
      industry: industry ?? this.industry,
      description: description ?? this.description,
      teamSize: teamSize ?? this.teamSize,
      location: location ?? this.location,
      companyIcon: companyIcon ?? this.companyIcon,
      companyIconColor: companyIconColor ?? this.companyIconColor,
      companyIconBackground:
          companyIconBackground ?? this.companyIconBackground,
    );
  }
}
