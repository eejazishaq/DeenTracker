import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';

/// Prayer schedule persistence and calculation boundary.
abstract interface class PrayerScheduleRepository {
  /// Returns cached or freshly calculated schedule for [date].
  Future<Result<PrayerSchedule>> getScheduleForDate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  });

  /// Resolves current prayer, next prayer, and countdown for [at].
  Future<Result<PrayerWindow>> getPrayerWindow({
    required DateTime at,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  });
}
