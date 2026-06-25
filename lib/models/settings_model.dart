import 'package:flutter/material.dart';

class SettingsModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final bool showArrow;
  final bool isEnabled;
  final VoidCallback? onTap;

  const SettingsModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconBackgroundColor = const Color(0xFFFFC107),
    this.iconColor = Colors.black,
    this.showArrow = true,
    this.isEnabled = true,
    this.onTap,
  });

  /// Create object from API response
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      icon: Icons.settings,
      showArrow: json['showArrow'] ?? true,
      isEnabled: json['isEnabled'] ?? true,
    );
  }

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'showArrow': showArrow,
      'isEnabled': isEnabled,
    };
  }

  /// Copy object with new values
  SettingsModel copyWith({
    String? title,
    String? subtitle,
    IconData? icon,
    Color? iconBackgroundColor,
    Color? iconColor,
    bool? showArrow,
    bool? isEnabled,
    VoidCallback? onTap,
  }) {
    return SettingsModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconColor: iconColor ?? this.iconColor,
      showArrow: showArrow ?? this.showArrow,
      isEnabled: isEnabled ?? this.isEnabled,
      onTap: onTap ?? this.onTap,
    );
  }
}
