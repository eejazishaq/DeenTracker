import 'package:deentrack/core/errors/result.dart';

/// Schedules and manages local prayer notifications and azan playback.
abstract interface class NotificationService {
  /// Initializes channels, permissions, and platform handlers.
  Future<Result<void>> initialize();

  /// Schedules all enabled prayer reminders for [date].
  Future<Result<void>> scheduleDailyPrayerNotifications({
    required DateTime date,
  });

  /// Cancels all pending prayer notifications.
  Future<Result<void>> cancelAllPrayerNotifications();

  /// Reschedules notifications after settings or location change.
  Future<Result<void>> rescheduleAll();

  /// Requests notification permission on supported platforms.
  Future<Result<bool>> requestPermission();
}
