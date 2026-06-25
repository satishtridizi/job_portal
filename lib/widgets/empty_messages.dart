import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class EmptyMessages extends StatelessWidget {
  const EmptyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardDark,
              border: Border.all(color: AppColors.primary.withOpacity(.45)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(.18),
                  blurRadius: 28,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(
              Icons.chat_bubble_outline_rounded,
              color: AppColors.primary,
              size: 38,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "No conversations found",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Try a different search term",
            style: TextStyle(color: AppColors.textGrey, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
