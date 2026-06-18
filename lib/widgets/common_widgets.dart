import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

/// HireHub Logo with glowing icon + title + subtitle
class HireHubLogo extends StatelessWidget {
  final String subtitle;
  const HireHubLogo({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Glowing icon container
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(.6),
                blurRadius: 35,
                spreadRadius: 8,
              ),
            ],
          ),
          child: const Icon(
            Icons.work_outline_rounded,
            color: Colors.black,
            size: 36,
          ),
        ),
        const SizedBox(height: 14),
        // App Name
        Text(
          'HireHub',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        // Subtitle row with icon
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.psychology_outlined,
              color: AppColors.primary,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              subtitle,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}

/// Glowing card container
class HireHubCard extends StatelessWidget {
  final Widget child;
  const HireHubCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF123A4A), Color(0xFF04131E)],
        ),
        border: Border.all(
          color: AppColors.primary.withOpacity(.45),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.15),
            blurRadius: 40,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// AI indicator badge
class AIBadge extends StatelessWidget {
  const AIBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff233A42),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'AI',
            style: TextStyle(color: AppColors.primary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// Custom input field with leading icon
class HireHubInputField extends StatelessWidget {
  final String hintText;
  final IconData leadingIcon;
  final bool obscureText;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? helperText;

  const HireHubInputField({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    this.obscureText = false,
    this.suffixWidget,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.25),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.primary.withOpacity(.45)),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: const TextStyle(color: AppColors.textWhite, fontSize: 14),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.iconColor,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                leadingIcon,
                color: AppColors.iconColor,
                size: 20,
              ),
              suffixIcon: suffixWidget,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4),
            child: Text(
              helperText!,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 11),
            ),
          ),
      ],
    );
  }
}

/// Primary yellow CTA button
class HireHubButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? prefixIcon;

  const HireHubButton({
    super.key,
    required this.label,
    required this.onTap,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              Icon(prefixIcon, color: Colors.black, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
