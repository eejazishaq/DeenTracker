import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService implements NotificationService {
  LocalNotificationService();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  @override
  Future<Result<void>> initialize() async {
    try {
      if (_initialized) return const Success(null);

      tz_data.initializeTimeZones();
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const ios = DarwinInitializationSettings();
      await _plugin.initialize(
        const InitializationSettings(android: android, iOS: ios),
      );

      const channel = AndroidNotificationChannel(
        'prayer_reminders',
        'Prayer Reminders',
        description: 'Salah reminder notifications',
        importance: Importance.high,
      );
      await _plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      _initialized = true;
      return const Success(null);
    } catch (error) {
      return FailureResult(NotificationFailure(cause: error));
    }
  }

  @override
  Future<Result<bool>> requestPermission() async {
    try {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      final ios = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

      var granted = true;
      if (android != null) {
        granted = await android.requestNotificationsPermission() ?? false;
      }
      if (ios != null) {
        granted = await ios.requestPermissions(alert: true, sound: true) ?? false;
      }
      return Success(granted);
    } catch (error) {
      return FailureResult(NotificationFailure(cause: error));
    }
  }

  @override
  Future<Result<void>> scheduleDailyPrayerNotifications({
    required DateTime date,
  }) async {
    // Detailed per-prayer scheduling wired with prayer engine in prayers feature.
    return const Success(null);
  }

  @override
  Future<Result<void>> cancelAllPrayerNotifications() async {
    try {
      await _plugin.cancelAll();
      return const Success(null);
    } catch (error) {
      return FailureResult(NotificationFailure(cause: error));
    }
  }

  @override
  Future<Result<void>> rescheduleAll() async {
    return const Success(null);
  }

  /// Schedules a single prayer reminder (used by prayers feature).
  Future<Result<void>> schedulePrayer({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'prayer_reminders',
            'Prayer Reminders',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
      return const Success(null);
    } catch (error) {
      return FailureResult(NotificationFailure(cause: error));
    }
  }
}
