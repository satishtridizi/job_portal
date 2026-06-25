import 'package:flutter/material.dart';
import 'package:jobportal/screens/JobPostingScreen.dart';
import 'package:jobportal/widgets/bottom_nav_bar.dart';
import '../data/messages_data.dart';
import '../models/message_model.dart';
import '../utils/app_colors.dart';
import '../widgets/ai_messages_header.dart';
import '../widgets/filter_chip.dart';
import '../widgets/message_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/empty_messages.dart';
import 'package:jobportal/screens/message_chat_screen.dart';
import 'package:jobportal/screens/apps_screen.dart';
import 'package:jobportal/screens/job_postings_app.dart';
import 'package:jobportal/screens/dashboard_screen.dart';
import 'package:jobportal/screens/messages_screen.dart';
import 'package:jobportal/screens/settings_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int get jobsCount => messagesData.where((e) => e.category == "Jobs").length;

  int get internshipsCount =>
      messagesData.where((e) => e.category == "Internships").length;

  int get freelanceCount =>
      messagesData.where((e) => e.category == "Freelance").length;
  final TextEditingController searchController = TextEditingController();

  List<String> get filters => [
    "All (${messagesData.length})",
    "Jobs ($jobsCount)",
    "Internships ($internshipsCount)",
    "Freelance ($freelanceCount)",
  ];

  String selectedFilter = "All";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<MessageModel> get filteredMessages {
    List<MessageModel> list = messagesData;

    final category = selectedFilter.split(" ").first;

    if (category != "All") {
      list = list.where((e) => e.category == category).toList();
    }

    if (searchController.text.trim().isNotEmpty) {
      final query = searchController.text.toLowerCase();

      list = list.where((e) {
        return e.name.toLowerCase().contains(query) ||
            e.role.toLowerCase().contains(query) ||
            e.message.toLowerCase().contains(query);
      }).toList();
    }

    return list;
  }

  int get totalUnread {
    return messagesData.fold(0, (sum, item) => sum + item.unreadCount);
  }

  void _onBottomTap(int index) {
    if (index == 3) return; // Already on Messages

    Widget screen;

    switch (index) {
      case 0:
        screen = const AppsScreen();
        break;

      case 1:
        screen = const JobPostingScreen();
        break;

      case 2:
        screen = const DashboardScreen();
        break;

      case 4:
        screen = const SettingsScreen();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              /// Header
              AiMessagesHeader(
                unreadMessages: totalUnread,
                onAiTap: () {
                  debugPrint("AI Clicked");
                },
              ),

              const SizedBox(height: 22),

              /// Search
              MessageSearchBar(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
              ),

              const SizedBox(height: 18),

              /// Filter Chips
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return MessageFilterChip(
                      title: filters[index],
                      isSelected: selectedFilter == filters[index],
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// Message List
              Expanded(
                child: filteredMessages.isEmpty
                    ? const EmptyMessages()
                    : ListView.builder(
                        itemCount: filteredMessages.length,
                        itemBuilder: (context, index) {
                          final message = filteredMessages[index];

                          return MessageCard(
                            message: message,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      MessageChatScreen(message: message),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: HireHubBottomNavBar(
        currentIndex: 3,
        onTap: _onBottomTap,
      ),
    );
  }
}
