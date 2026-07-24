import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraSubtitle extends StatelessWidget {
  const AuraSubtitle({super.key, required this.subtitle, this.alignment});
  final String subtitle;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(color: AppColors.grey, fontSize: 15),
      textAlign: alignment ?? TextAlign.start,
    );
  }
}
