import 'package:flutter/material.dart';
import 'package:jobportal/screens/JobPostingScreen.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/dashboard_screen.dart';
import 'package:jobportal/screens/login_screen.dart';
import 'package:jobportal/utils/app_colors.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruiter Database Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: AppColors.bg),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
