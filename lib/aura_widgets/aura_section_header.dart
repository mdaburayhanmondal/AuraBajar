import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:flutter/material.dart';

class AuraSectionHeader extends StatelessWidget {
  const AuraSectionHeader({
    super.key,
    required this.sectionTitle,
    required this.linkText,
    this.onTap,
  });
  final String sectionTitle, linkText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AuraTitle(title: sectionTitle),
        AuraLinkedText(text: linkText, onTap: onTap),
      ],
    );
  }
}
