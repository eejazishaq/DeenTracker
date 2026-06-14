import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

/// Resolves localized strings with English/Arabic fallbacks when assets are stale.
abstract final class AppTranslations {
  static String of(
    BuildContext context,
    String key, {
    required String en,
    required String ar,
  }) {
    final value = context.tr(key);
    if (value != key) {
      return value;
    }
    return context.locale.languageCode == 'ar' ? ar : en;
  }
}
