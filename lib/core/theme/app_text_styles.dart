import 'package:deentrack/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography scale aligned with the Stitch Flutter spec sheet.
abstract final class AppTextStyles {
  static TextTheme buildTextTheme({
    required Brightness brightness,
    required double scaleFactor,
  }) {
    final Color primaryText =
        brightness == Brightness.light ? Colors.black87 : Colors.white;

    final Color secondaryText =
        brightness == Brightness.light ? Colors.black54 : Colors.white70;

    TextStyle scaled(TextStyle style) =>
        style.copyWith(fontSize: (style.fontSize ?? 14) * scaleFactor);

    return TextTheme(
      displayLarge: scaled(
        GoogleFonts.inter(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: primaryText,
          height: 1.15,
        ),
      ),
      displayMedium: scaled(
        GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: primaryText,
        ),
      ),
      headlineLarge: scaled(
        GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
      ),
      titleLarge: scaled(
        GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
      ),
      titleMedium: scaled(
        GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
      ),
      bodyLarge: scaled(
        GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: primaryText,
          height: 1.5,
        ),
      ),
      bodyMedium: scaled(
        GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: secondaryText,
          height: 1.45,
        ),
      ),
      labelLarge: scaled(
        GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: primaryText,
          letterSpacing: 0.6,
        ),
      ),
      labelSmall: scaled(
        GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: AppColors.deepEmerald,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  /// Monospace style for countdown timers and metrics.
  static TextStyle countdown({
    required Brightness brightness,
    double scaleFactor = 1,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: 24 * scaleFactor,
      fontWeight: FontWeight.w900,
      color: brightness == Brightness.light ? Colors.black87 : Colors.white,
    );
  }
}
