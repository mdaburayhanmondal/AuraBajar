import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraHeading extends StatelessWidget {
  const AuraHeading({super.key, required this.text, this.alignment});

  final String text;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: AppColors.black,
      ),
      textAlign: alignment ?? TextAlign.start,
    );
  }
}
