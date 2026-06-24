import 'package:flutter/material.dart';

class RequirementsSection extends StatefulWidget {
  final List<String> requirements;
  final Function(String) onAddRequirement;

  const RequirementsSection({
    super.key,
    required this.requirements,
    required this.onAddRequirement,
  });

  @override
  State<RequirementsSection> createState() => _RequirementsSectionState();
}

class _RequirementsSectionState extends State<RequirementsSection> {
  final TextEditingController _controller = TextEditingController();

  void _addRequirement() {
    final value = _controller.text.trim();

    if (value.isEmpty) return;

    widget.onAddRequirement(value);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Requirements",
          style: TextStyle(
            color: Color(0xFFFFE082),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.amber.withOpacity(.3)),
            gradient: const LinearGradient(
              colors: [Color(0xFF01111A), Color(0xFF021E2E)],
            ),
          ),
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "e.g. 3+ years Flutter experience",
              hintStyle: const TextStyle(color: Colors.white38),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              suffixIcon: IconButton(
                onPressed: _addRequirement,
                icon: const Icon(Icons.add_circle, color: Colors.amber),
              ),
            ),
            onSubmitted: (_) => _addRequirement(),
          ),
        ),

        const SizedBox(height: 16),

        ...widget.requirements
            .asMap()
            .entries
            .map(
              (entry) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF02111A),
                  border: Border.all(color: Colors.amber.withOpacity(.2)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.amber,
                      size: 18,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        entry.value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
