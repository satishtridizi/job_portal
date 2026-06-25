import 'package:flutter/material.dart';
import '../models/company_model.dart';

class CompanyCard extends StatelessWidget {
  final CompanyModel company;
  final VoidCallback? onEdit;

  const CompanyCard({super.key, required this.company, this.onEdit});

  static const bg = Color(0xff050A0D);
  static const border = Color(0xff6E5A0A);
  static const card = Color(0xff0A2430);
  static const yellow = Color(0xffFFC107);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Company Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.45),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.business_center_outlined,
                  size: 34,
                  color: Colors.black,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company.companyName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      company.industry,
                      style: const TextStyle(color: yellow, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Divider(color: Colors.amber.withOpacity(.15), thickness: 1),

          const SizedBox(height: 14),

          Text(
            company.description,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),

          const SizedBox(height: 14),

          Divider(color: Colors.amber.withOpacity(.15), thickness: 1),

          const SizedBox(height: 18),

          /// Team Size + Industry
          Row(
            children: [
              Expanded(
                child: _infoCard(
                  icon: Icons.people_outline,
                  title: "Team Size",
                  value: "1-10 employees",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoCard(
                  icon: Icons.business_outlined,
                  title: "Industry",
                  value: "Technology",
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// Location
          _infoCard(
            icon: Icons.location_on_outlined,
            title: "Location",
            value: company.location,
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: onEdit,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xff2A2A12),
                side: const BorderSide(color: border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(
                Icons.business_center_outlined,
                color: yellow,
                size: 18,
              ),
              label: const Text(
                "Edit Company Profile",
                style: TextStyle(color: yellow, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      height: 92, // Fixed height for all cards
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF082533),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A4A56)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: const Color(0xFFFFC107)),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(color: Color(0xFF7F8C8D), fontSize: 13),
              ),
            ],
          ),

          const Spacer(),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
