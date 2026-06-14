import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';

/// Calculates Islamic prayer times using the `adhan` package.
abstract interface class PrayerCalculationService {
  /// Computes prayer times for [date] at the given coordinates.
  Future<Result<PrayerSchedule>> calculateDailySchedule({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  });

  /// Returns current prayer, next prayer, remaining time, and progress.
  ///
  /// Pass [nextDaySchedule] so after Isha the next target resolves to Fajr.
  Future<Result<PrayerWindow>> getPrayerWindow({
    required PrayerSchedule schedule,
    DateTime? at,
    PrayerSchedule? nextDaySchedule,
  });
}
