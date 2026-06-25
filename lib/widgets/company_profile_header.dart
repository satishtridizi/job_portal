import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CompanyProfileHeader extends StatelessWidget {
  const CompanyProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(.45),
                  blurRadius: 28,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: const Icon(
              Icons.apartment_rounded,
              color: Colors.black,
              size: 46,
            ),
          ),
        ],
      ),
    );
  }
}
