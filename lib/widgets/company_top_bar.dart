import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CompanyTopBar extends StatelessWidget {
  const CompanyTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
            size: 28,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Edit Company Profile",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Row(
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    size: 15,
                    color: AppColors.primary,
                  ),

                  SizedBox(width: 5),

                  Text(
                    "Company Settings",
                    style: TextStyle(color: AppColors.primary, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: const Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: AppColors.primary),

              SizedBox(width: 6),

              Text(
                "AI",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
