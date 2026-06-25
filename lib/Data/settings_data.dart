import 'package:flutter/material.dart';

import '../models/company_model.dart';
import '../models/settings_model.dart';
import '../models/support_item_model.dart';

/// ----------------------
/// Company Information
/// ----------------------

final CompanyModel companyData = CompanyModel(
  companyName: "My Company",
  industry: "Technology",
  description: "Welcome to our company",
  teamSize: "1 - 10 Employees",
  location: "Hyderabad, India",
  companyIcon: Icons.business,
  companyIconBackground: const Color(0xFFFFC107),
  companyIconColor: Colors.black,
);

/// ----------------------
/// Account Settings
/// ----------------------

final List<SettingsModel> accountSettings = [
  SettingsModel(
    title: "Email Preferences",
    subtitle: "Manage email notifications",
    icon: Icons.email_outlined,
    iconBackgroundColor: const Color(0xFFFFC107),
    iconColor: Colors.black,
    onTap: () {
      debugPrint("Email Preferences Clicked");
    },
  ),

  SettingsModel(
    title: "Notifications",
    subtitle: "Configure push notifications",
    icon: Icons.notifications_none_outlined,
    iconBackgroundColor: const Color(0xFF1D4ED8),
    iconColor: Colors.white,
    onTap: () {
      debugPrint("Notifications Clicked");
    },
  ),

  SettingsModel(
    title: "Password & Security",
    subtitle: "Update password and 2FA",
    icon: Icons.lock_outline,
    iconBackgroundColor: const Color(0xFF16A34A),
    iconColor: Colors.white,
    onTap: () {
      debugPrint("Password Clicked");
    },
  ),
];

/// ----------------------
/// Support & Legal
/// ----------------------

final List<SupportItemModel> supportItems = [
  const SupportItemModel(title: "Contact Support"),
  const SupportItemModel(title: "Help Center"),
  const SupportItemModel(title: "Terms of Service"),
  const SupportItemModel(title: "Privacy Policy"),
];

/// ----------------------
/// App Information
/// ----------------------

const String appVersion = "Version 1.0.0";

const String appPoweredBy = "AI Powered";
