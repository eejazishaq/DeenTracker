import 'package:deentrack/core/database/isar_database.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/services/interfaces/analytics_service.dart';
import 'package:deentrack/core/services/interfaces/hijri_calendar_service.dart';
import 'package:deentrack/core/services/implementations/compass_qibla_service.dart';
import 'package:deentrack/core/services/implementations/geolocator_location_service.dart';
import 'package:deentrack/core/services/implementations/isar_analytics_service.dart';
import 'package:deentrack/core/services/implementations/local_hijri_calendar_service.dart';
import 'package:deentrack/core/services/implementations/local_notification_service.dart';
import 'package:deentrack/core/services/interfaces/location_service.dart';
import 'package:deentrack/core/services/interfaces/notification_service.dart';
import 'package:deentrack/core/services/interfaces/qibla_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Local Isar instance. Throws if database initialization failed.
final isarProvider = FutureProvider<Isar>((ref) async {
  final result = await IsarDatabase.open();
  return result.valueOrNull ??
      (throw const DatabaseFailure(message: 'Database is not available.'));
});

/// Service interfaces are bound to implementations in later phases.
/// Placeholder providers throw [UnimplementedError] until wired.

final locationServiceProvider = Provider<LocationService>(
  (ref) => GeolocatorLocationService(),
);

final localNotificationServiceProvider = Provider<LocalNotificationService>(
  (ref) => LocalNotificationService(),
);

final notificationServiceProvider = Provider<NotificationService>(
  (ref) => ref.watch(localNotificationServiceProvider),
);

final qiblaServiceProvider = Provider<QiblaService>(
  (ref) => CompassQiblaService(),
);

final hijriCalendarServiceProvider = Provider<HijriCalendarService>(
  (ref) => LocalHijriCalendarService(),
);

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return IsarAnalyticsService(isar);
});
