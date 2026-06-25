import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class MessageSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const MessageSearchBar({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
          hintText: "Search conversations...",
          hintStyle: const TextStyle(color: AppColors.textGrey, fontSize: 15),
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
              onChanged?.call("");
            },
            icon: const Icon(Icons.close, color: AppColors.textGrey),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
