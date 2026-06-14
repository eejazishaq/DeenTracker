import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/prayer_calculation_service.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/data/mappers/prayer_schedule_mapper.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';
import 'package:isar/isar.dart';
import 'package:deentrack/core/database/collections/prayer_time_collection.dart';

/// Isar-backed repository delegating calculations to [PrayerCalculationService].
class PrayerScheduleRepositoryImpl implements PrayerScheduleRepository {
  PrayerScheduleRepositoryImpl({
    required Isar isar,
    required PrayerCalculationService calculationService,
  })  : _isar = isar,
        _calculationService = calculationService;

  final Isar _isar;
  final PrayerCalculationService _calculationService;

  @override
  Future<Result<PrayerSchedule>> getScheduleForDate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) async {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final dateKey = PrayerScheduleMapper.dateKey(normalizedDate);

    final cached = await _isar.prayerTimeCollections
        .filter()
        .dateEqualTo(dateKey)
        .findFirst();

    if (cached != null &&
        _cacheIsValid(
          cached,
          latitude: latitude,
          longitude: longitude,
          calculationMethod: calculationMethod,
        )) {
      return Success(PrayerScheduleMapper.fromCollection(cached));
    }

    final calculated = await _calculationService.calculateDailySchedule(
      date: normalizedDate,
      latitude: latitude,
      longitude: longitude,
      calculationMethod: calculationMethod,
    );

    if (calculated case Success<PrayerSchedule>(:final value)) {
      await _isar.writeTxn(() async {
        final existing = await _isar.prayerTimeCollections
            .filter()
            .dateEqualTo(dateKey)
            .findFirst();

        final collection = PrayerScheduleMapper.toCollection(value);
        if (existing != null) {
          collection.id = existing.id;
        }
        await _isar.prayerTimeCollections.put(collection);
      });
    }

    return calculated;
  }

  @override
  Future<Result<PrayerWindow>> getPrayerWindow({
    required DateTime at,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) async {
    final today = DateTime(at.year, at.month, at.day);
    final tomorrow = today.add(const Duration(days: 1));

    final todayResult = await getScheduleForDate(
      date: today,
      latitude: latitude,
      longitude: longitude,
      calculationMethod: calculationMethod,
    );

    if (todayResult case FailureResult<PrayerSchedule>(:final failure)) {
      return FailureResult(failure);
    }

    final todaySchedule = (todayResult as Success<PrayerSchedule>).value;

    final tomorrowResult = await getScheduleForDate(
      date: tomorrow,
      latitude: latitude,
      longitude: longitude,
      calculationMethod: calculationMethod,
    );

    final PrayerSchedule? tomorrowSchedule = switch (tomorrowResult) {
      Success<PrayerSchedule>(:final value) => value,
      FailureResult<PrayerSchedule>() => null,
    };

    return _calculationService.getPrayerWindow(
      schedule: todaySchedule,
      nextDaySchedule: tomorrowSchedule,
      at: at,
    );
  }

  bool _cacheIsValid(
    PrayerTimeCollection cached, {
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) {
    const epsilon = 0.0001;
    final latMatches = (cached.latitude - latitude).abs() < epsilon;
    final lonMatches = (cached.longitude - longitude).abs() < epsilon;
    final methodMatches = cached.calculationMethod == calculationMethod;
    return latMatches && lonMatches && methodMatches;
  }
}
