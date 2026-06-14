import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';
import 'package:deentrack/features/prayers/domain/usecases/get_daily_prayer_schedule_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeScheduleRepository implements PrayerScheduleRepository {
  @override
  Future<Result<PrayerSchedule>> getScheduleForDate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) async {
    return Success(
      PrayerSchedule(
        date: date,
        fajr: DateTime(date.year, date.month, date.day, 4, 30),
        sunrise: DateTime(date.year, date.month, date.day, 5, 45),
        dhuhr: DateTime(date.year, date.month, date.day, 12, 15),
        asr: DateTime(date.year, date.month, date.day, 15, 40),
        maghrib: DateTime(date.year, date.month, date.day, 18, 20),
        isha: DateTime(date.year, date.month, date.day, 19, 45),
        calculationMethod: calculationMethod,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  Future<Result<PrayerWindow>> getPrayerWindow({
    required DateTime at,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) {
    throw UnimplementedError();
  }
}

void main() {
  test('returns schedule for requested day', () async {
    final useCase = GetDailyPrayerScheduleUseCase(_FakeScheduleRepository());
    final date = DateTime(2026, 6, 10);

    final result = await useCase(
      date: date,
      latitude: 21.4225,
      longitude: 39.8262,
      calculationMethod: 'Umm Al-Qura University, Makkah',
    );

    expect(result, isA<Success<PrayerSchedule>>());
    expect((result as Success<PrayerSchedule>).value.date, date);
    expect(result.value.slots, hasLength(5));
  });
}
