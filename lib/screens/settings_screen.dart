import 'package:flutter/material.dart';
import 'package:jobportal/screens/ContactSupportScreen.dart';
import 'package:jobportal/screens/JobPostingScreen.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/dashboard_screen.dart';
import 'package:jobportal/screens/edit_company_profile_screen.dart';
import 'package:jobportal/screens/messages_screen.dart';
import 'package:jobportal/widgets/bottom_nav_bar.dart';
import '../data/settings_data.dart';
import '../widgets/company_card.dart';
import '../widgets/logout_button.dart';
import '../widgets/primary_button.dart';
import '../widgets/settings_top_card.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';
import '../widgets/support_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07161D),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const SettingsTopCard(),
              const SizedBox(height: 24),

              /// Raise Query Button
              PrimaryButton(
                text: "Raise a Query",
                icon: Icons.chat_bubble_outline,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContactSupportScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// Company Information
              CompanyCard(
                company: companyData,
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditCompanyProfileScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// Account Settings
              SettingsSection(
                title: "Account Settings",
                icon: Icons.psychology_outlined,
                children: accountSettings
                    .map((item) => SettingsTile(item: item))
                    .toList(),
              ),

              const SizedBox(height: 24),

              /// Support & Legal
              SettingsSection(
                title: "Support & Legal",
                icon: Icons.help_outline,
                children: supportItems
                    .map((item) => SupportTile(item: item))
                    .toList(),
              ),

              const SizedBox(height: 30),

              /// Logout Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 68, 68, 68),
                    width: 1.2,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF111111),
                      Color.fromARGB(255, 68, 68, 68),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: LogoutButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                ),
              ),

              const SizedBox(height: 24),

              /// Version
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: Color(0xFFFFC107),
                      size: 16,
                    ),

                    const SizedBox(width: 6),

                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: appVersion,
                            style: const TextStyle(color: Color(0xFF8B8B8B)),
                          ),
                          const TextSpan(
                            text: " - ",
                            style: TextStyle(color: Color(0xFF8B8B8B)),
                          ),
                          TextSpan(
                            text: appPoweredBy,
                            style: const TextStyle(color: Color(0xFF8B8B8B)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: 4, // Postings selected
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AppsScreen()),
              );
              break;

            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JobPostingScreen()),
              );
              break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MessagesScreen()),
              );
              break;

            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              break;
          }
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text("Logout"),
              onPressed: () {
                Navigator.pop(context);

                /// TODO:
                /// Clear SharedPreferences
                /// Remove Token
                /// Navigate to Login Screen

                debugPrint("Logout");
              },
            ),
          ],
        );
      },
    );
  }
}
