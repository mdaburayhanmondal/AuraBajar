import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraButton extends StatelessWidget {
  const AuraButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.outlined = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      minimumSize: Size(width, height),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );

    return SizedBox(
      width: width,
      height: height,
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: style.copyWith(
                side: WidgetStatePropertyAll(
                  const BorderSide(color: AppColors.primary, width: 1.5),
                ),
                foregroundColor: const WidgetStatePropertyAll(
                  AppColors.primary,
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  Colors.transparent,
                ),
              ),
              child: Text(text),
            )
          : FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                disabledBackgroundColor: AppColors.lightGrey,
                disabledForegroundColor: AppColors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text(text),
            ),
    );
  }
}
