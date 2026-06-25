import 'package:flutter/material.dart';
import '../models/support_item_model.dart';

class SupportTile extends StatelessWidget {
  final SupportItemModel item;

  const SupportTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.isEnabled
          ? () {
              debugPrint("${item.title} Clicked");
            }
          : null,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
        child: Row(
          children: [
            /// Title
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  color: item.isEnabled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Arrow
            if (item.showArrow)
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF17242D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFFC107),
                  size: 15,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
