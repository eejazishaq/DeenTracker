import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Material 3 themes derived from the Stitch design system spec.
abstract final class AppTheme {
  static ThemeData light({double textScaleFactor = 1}) => _buildTheme(
        brightness: Brightness.light,
        textScaleFactor: textScaleFactor,
      );

  static ThemeData dark({double textScaleFactor = 1}) => _buildTheme(
        brightness: Brightness.dark,
        textScaleFactor: textScaleFactor,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required double textScaleFactor,
  }) {
    final bool isLight = brightness == Brightness.light;

    final colorScheme = isLight
        ? const ColorScheme.light(
            primary: AppColors.deepEmerald,
            onPrimary: Colors.white,
            secondary: AppColors.warmGold,
            onSecondary: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black87,
            error: AppColors.error,
            onError: Colors.white,
          )
        : const ColorScheme.dark(
            primary: AppColors.deepEmerald,
            onPrimary: Colors.white,
            secondary: AppColors.warmGold,
            onSecondary: Colors.black,
            surface: AppColors.zinc900,
            onSurface: Colors.white,
            error: AppColors.error,
            onError: Colors.white,
          );

    final textTheme = AppTextStyles.buildTextTheme(
      brightness: brightness,
      scaleFactor: textScaleFactor,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isLight ? AppColors.softIvory : AppColors.charcoalDark,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: isLight ? AppColors.deepEmerald : Colors.white,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: isLight ? Colors.white : AppColors.zinc900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isLight ? Colors.grey.shade100 : AppColors.zinc850,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: isLight ? Colors.grey.shade100 : AppColors.zinc850,
        thickness: 1,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.deepEmerald;
          }
          return isLight ? Colors.grey.shade300 : AppColors.zinc850;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isLight ? Colors.grey.shade50 : AppColors.zinc850,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isLight ? Colors.grey.shade200 : AppColors.zinc850,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isLight ? Colors.grey.shade200 : AppColors.zinc850,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.deepEmerald),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
