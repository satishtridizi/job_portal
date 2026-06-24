import 'package:flutter/material.dart';

class PublishActionButtons extends StatelessWidget {
  final VoidCallback onSaveDraft;
  final VoidCallback onPublish;

  const PublishActionButtons({
    super.key,
    required this.onSaveDraft,
    required this.onPublish,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onSaveDraft,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFF9E9E9E),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Save as Draft",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: GestureDetector(
            onTap: onPublish,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC400),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(.35),
                    blurRadius: 16,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                "Publish Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
