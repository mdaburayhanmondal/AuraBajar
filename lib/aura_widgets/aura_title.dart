import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraTitle extends StatelessWidget {
  const AuraTitle({super.key, required this.title, this.alignment});
  final String title;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: alignment ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
