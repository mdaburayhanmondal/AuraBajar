import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AuraTitle(title: "Checkout")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            // delivery address
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 12,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: AuraTitle(title: "Delivery Address"),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentGeometry.topCenter,
                          child: Icon(Icons.location_on_outlined, size: 28),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abu Rayhan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AuraSubtitle(subtitle: "Nakhalpara"),
                              AuraSubtitle(
                                subtitle: "Mohakhali, Tejgaon, Dhaka, 1215",
                              ),
                              AuraSubtitle(subtitle: "+880 1317 546595"),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AuraLinkedText(text: "Change"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
