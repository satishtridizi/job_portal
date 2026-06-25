import 'package:flutter/material.dart';
import '../models/message_model.dart';

const List<MessageModel> messagesData = [
  MessageModel(
    name: "Sarah Johnson",
    role: "Senior Frontend Developer",
    message: "Thank you! When can I expect to hear back?",
    time: "2 hours ago",
    category: "Jobs",
    unreadCount: 2,
    avatarColor: Color(0xFFFFC107),
    isOnline: true,
  ),

  MessageModel(
    name: "Michael Chen",
    role: "Product Designer",
    message: "I can do Tuesday at 2 PM.",
    time: "1 day ago",
    category: "Jobs",
    unreadCount: 1,
    avatarColor: Color(0xFFFFC107),
    isOnline: true,
  ),

  MessageModel(
    name: "Emily Rodriguez",
    role: "Marketing Intern",
    message: "Looking forward to it!",
    time: "2 days ago",
    category: "Internships",
    unreadCount: 0,
    avatarColor: Color(0xFFFFC107),
    isOnline: false,
  ),

  MessageModel(
    name: "James Wilson",
    role: "UX Writer (Freelance)",
    message: "Thanks for considering my application.",
    time: "3 days ago",
    category: "Freelance",
    unreadCount: 0,
    avatarColor: Color(0xFFFFC107),
    isOnline: false,
  ),

  MessageModel(
    name: "Olivia Brown",
    role: "Flutter Developer",
    message: "I've attached my updated resume.",
    time: "4 days ago",
    category: "Jobs",
    unreadCount: 3,
    avatarColor: Color(0xFFFFC107),
    isOnline: true,
  ),

  MessageModel(
    name: "Daniel Smith",
    role: "Backend Developer",
    message: "Can we schedule a technical interview?",
    time: "5 days ago",
    category: "Jobs",
    unreadCount: 0,
    avatarColor: Color(0xFFFFC107),
    isOnline: false,
  ),

  MessageModel(
    name: "Sophia Miller",
    role: "UI/UX Intern",
    message: "Thank you for the opportunity.",
    time: "6 days ago",
    category: "Internships",
    unreadCount: 1,
    avatarColor: Color(0xFFFFC107),
    isOnline: true,
  ),

  MessageModel(
    name: "William Taylor",
    role: "React Developer (Freelance)",
    message: "I'm available to start immediately.",
    time: "1 week ago",
    category: "Freelance",
    unreadCount: 0,
    avatarColor: Color(0xFFFFC107),
    isOnline: false,
  ),
];
