import 'package:flutter/material.dart';
import 'package:jobportal/models/ChatUser.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff02121f), Color(0xff02253d), Color(0xff001018)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// HEADER
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.amber.withOpacity(.4)),
                  ),
                ),
                child: Row(
                  children: [
                    /// BACK BUTTON
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.amber),
                    ),

                    /// AVATAR
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(color: Colors.amber, blurRadius: 18),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          widget.user.avatarText,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// USER DETAILS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.user.designation,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call_outlined,
                        color: Colors.amber,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.videocam_outlined,
                        color: Colors.amber,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(.12),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.amber.withOpacity(.4)),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.auto_awesome,
                            size: 14,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "AI",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// CHAT AREA
              const Expanded(child: SizedBox()),

              /// INPUT SECTION
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.amber.withOpacity(.5),
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 14),

                                Expanded(
                                  child: TextField(
                                    controller: messageController,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "AI-enhanced messaging...",
                                      hintStyle: TextStyle(
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.multitrack_audio,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey.shade600,
                          child: IconButton(
                            onPressed: () {
                              print(messageController.text);
                            },
                            icon: const Icon(Icons.send, color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "✨ AI-powered conversation assistant",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.4),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
