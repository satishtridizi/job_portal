import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SupportTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int maxLines;

  const SupportTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.textWhite, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey, fontSize: 16),
        filled: true,
        fillColor: AppColors.cardDark,

        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: maxLines == 1 ? 14 : 18,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.cardBorder, width: 1.2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
