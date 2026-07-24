import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraLinkedText extends StatelessWidget {
  const AuraLinkedText({
    super.key,
    required this.text,
    this.onTap,
    this.alignment,
  });
  final String text;
  final VoidCallback? onTap;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        textAlign: alignment ?? TextAlign.start,
      ),
    );
  }
}
