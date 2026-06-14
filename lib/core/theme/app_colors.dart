import 'package:flutter/material.dart';

/// Design tokens from the Google Stitch DesignSystemView spec sheet.
abstract final class AppColors {
  // Brand
  static const Color deepEmerald = Color(0xFF0D5C3A);
  static const Color deepEmeraldDark = Color(0xFF0B4C30);
  static const Color warmGold = Color(0xFFD4AF37);
  static const Color warmGoldDark = Color(0xFFC5A059);

  // Surfaces
  static const Color softIvory = Color(0xFFFAF9F6);
  static const Color charcoalDark = Color(0xFF121212);
  static const Color studioBackground = Color(0xFFF0EFEB);

  // Semantic
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD84315);

  // Stitch accent palette
  static const Color tealDeep = Color(0xFF103E44);
  static const Color tealForest = Color(0xFF122A21);
  static const Color amberAccent = Color(0xFFF0C265);
  static const Color slateNav = Color(0xFF1E293B);

  // Card surfaces (dark mode)
  static const Color zinc900 = Color(0xFF18181B);
  static const Color zinc850 = Color(0xFF27272A);
}
