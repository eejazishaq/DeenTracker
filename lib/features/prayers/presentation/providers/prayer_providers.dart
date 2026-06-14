import 'package:deentrack/core/constants/app_constants.dart';
import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/providers/invalidation_providers.dart';
import 'package:deentrack/features/settings/presentation/providers/settings_providers.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/services/implementations/adhan_prayer_calculation_service.dart';
import 'package:deentrack/core/services/interfaces/prayer_calculation_service.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/data/repositories/prayer_schedule_repository_impl.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';
import 'package:deentrack/features/prayers/domain/usecases/get_daily_prayer_schedule_use_case.dart';
import 'package:deentrack/features/prayers/domain/usecases/get_prayer_window_use_case.dart';
import 'package:deentrack/features/prayers/presentation/models/prayer_engine_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final prayerCalculationServiceProvider = Provider<PrayerCalculationService>(
  (ref) => const AdhanPrayerCalculationService(),
);

final prayerScheduleRepositoryProvider = Provider<PrayerScheduleRepository>(
  (ref) {
    final isar = ref.watch(isarProvider).requireValue;
    return PrayerScheduleRepositoryImpl(
      isar: isar,
      calculationService: ref.watch(prayerCalculationServiceProvider),
    );
  },
);

final getDailyPrayerScheduleUseCaseProvider =
    Provider<GetDailyPrayerScheduleUseCase>(
  (ref) => GetDailyPrayerScheduleUseCase(
    ref.watch(prayerScheduleRepositoryProvider),
  ),
);

final getPrayerWindowUseCaseProvider = Provider<GetPrayerWindowUseCase>(
  (ref) => GetPrayerWindowUseCase(
    ref.watch(prayerScheduleRepositoryProvider),
  ),
);

final prayerEngineSettingsProvider = FutureProvider<PrayerEngineSettings>(
  (ref) async {
    ref.watch(settingsRevisionProvider);
    final settings = await ref.watch(userSettingsProvider.future);
    return _settingsFromCollection(settings);
  },
);

PrayerEngineSettings _settingsFromCollection(UserSettingsCollection? settings) {
  return PrayerEngineSettings(
    latitude: settings?.latitude ?? AppConstants.defaultLatitude,
    longitude: settings?.longitude ?? AppConstants.defaultLongitude,
    calculationMethod:
        settings?.calculationMethod ?? AppConstants.defaultCalculationMethod,
    locationName: settings?.locationName ?? AppConstants.defaultLocationName,
  );
}

/// Live prayer window refreshed every second for Stitch countdown UI.
final prayerWindowProvider = StreamProvider<PrayerWindow>((ref) async* {
  final settings = await ref.watch(prayerEngineSettingsProvider.future);
  final useCase = ref.watch(getPrayerWindowUseCaseProvider);

  while (true) {
    final result = await useCase(
      latitude: settings.latitude,
      longitude: settings.longitude,
      calculationMethod: settings.calculationMethod,
    );

    if (result case Success<PrayerWindow>(:final value)) {
      yield value;
    }

    await Future<void>.delayed(const Duration(seconds: 1));
  }
});

/// Today's full schedule for the prayers list UI.
final todayPrayerScheduleProvider = FutureProvider<PrayerSchedule>(
  (ref) async {
    final settings = await ref.watch(prayerEngineSettingsProvider.future);
    final useCase = ref.watch(getDailyPrayerScheduleUseCaseProvider);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final result = await useCase(
      date: today,
      latitude: settings.latitude,
      longitude: settings.longitude,
      calculationMethod: settings.calculationMethod,
    );

    return switch (result) {
      Success<PrayerSchedule>(:final value) => value,
      FailureResult<PrayerSchedule>(:final failure) => throw failure,
    };
  },
);
