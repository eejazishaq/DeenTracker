import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

/// Resolves localized strings without logging missing-key warnings.
abstract final class AppTranslations {
  static String of(
    BuildContext context,
    String key, {
    required String en,
    required String ar,
  }) {
    if (context.trExists(key)) {
      return context.tr(key);
    }
    return context.locale.languageCode == 'ar' ? ar : en;
  }
}

/// Service shortcut labels used in the Qibla arc hero.
abstract final class HomeServiceLabels {
  static String prayerTimes(BuildContext context) => AppTranslations.of(
        context,
        'home_service_prayer_times',
        en: 'Prayer Times',
        ar: 'مواقيت الصلاة',
      );

  static String prayerTracker(BuildContext context) => AppTranslations.of(
        context,
        'home_service_prayer_tracker',
        en: 'Prayer Tracker',
        ar: 'متابعة الصلاة',
      );

  static String prayerTimesShort(BuildContext context) => AppTranslations.of(
        context,
        'home_service_times_short',
        en: 'Times',
        ar: 'المواقيت',
      );

  static String prayerTrackerShort(BuildContext context) => AppTranslations.of(
        context,
        'home_service_tracker_short',
        en: 'Tracker',
        ar: 'المتابعة',
      );
}
