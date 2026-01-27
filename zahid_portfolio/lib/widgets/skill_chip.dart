// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;

  const SkillChip({super.key, required this.label, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: (color ?? Theme.of(context).colorScheme.primary).withOpacity(
          0.15,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: (color ?? Theme.of(context).colorScheme.primary).withOpacity(
            0.3,
          ),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 18,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: color ?? Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
