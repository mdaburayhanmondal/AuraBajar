import 'package:flutter/material.dart';

class AppColors {
  // Brand
  static const primary = Color(0xFFFF6B35); // orange — buttons, CTAs
  static const onPrimary = Colors.white; // text/icons on top of primary

  static const secondary = Color(0xFF2563EB); // blue — links, secondary actions
  static const onSecondary = Colors.white;

  static const success = Color(0xFF22C55E); // green — in stock, discount
  static const error = Color(0xFFDC2626); // red — out of stock, errors

  // Neutrals
  static const black = Color(0xFF121212);
  static const grey = Color(0xFF6B7280);
  static const lightGrey = Color(0xFFF3F4F6);
  static const white = Colors.white;

  // Dark mode versions (optional, use later)
  static const backgroundDark = Color(0xFF121212);
  static const surfaceDark = Color(0xFF1E1E1E);
}
