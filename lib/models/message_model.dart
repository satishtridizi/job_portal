import 'package:flutter/material.dart';

class MessageModel {
  final String name;
  final String role;
  final String message;
  final String time;
  final String category;
  final int unreadCount;
  final Color avatarColor;
  final bool isOnline;

  const MessageModel({
    required this.name,
    required this.role,
    required this.message,
    required this.time,
    required this.category,
    required this.unreadCount,
    required this.avatarColor,
    this.isOnline = false,
  });

  String get initials {
    if (name.trim().isEmpty) return "";

    final parts = name.trim().split(" ");

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  bool get hasUnread => unreadCount > 0;
}
