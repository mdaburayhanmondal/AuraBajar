import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraSubtitle extends StatelessWidget {
  const AuraSubtitle({
    super.key,
    required this.subtitle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.textOverflow,
  });
  final String subtitle;
  final TextAlign? alignment;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 15,
        fontWeight: weight ?? FontWeight.normal,
      ),
      textAlign: alignment ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
