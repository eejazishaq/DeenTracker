import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';
import 'package:deentrack/features/prayers/domain/usecases/get_prayer_window_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakePrayerScheduleRepository implements PrayerScheduleRepository {
  _FakePrayerScheduleRepository(this.window);

  final PrayerWindow window;

  @override
  Future<Result<PrayerSchedule>> getScheduleForDate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<PrayerWindow>> getPrayerWindow({
    required DateTime at,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) async {
    return Success(window);
  }
}

void main() {
  final window = PrayerWindow(
    current: PrayerSlot(
      id: 'dhuhr',
      name: 'Dhuhr',
      arabicName: 'الظهر',
      time: DateTime(2026, 6, 10, 12, 15),
    ),
    next: PrayerSlot(
      id: 'asr',
      name: 'Asr',
      arabicName: 'العصر',
      time: DateTime(2026, 6, 10, 15, 30),
    ),
    remaining: const Duration(hours: 2, minutes: 14, seconds: 55),
    progress: 42,
  );

  test('delegates to repository with coordinates', () async {
    final useCase = GetPrayerWindowUseCase(
      _FakePrayerScheduleRepository(window),
    );

    final result = await useCase(
      latitude: 21.4225,
      longitude: 39.8262,
      calculationMethod: 'Umm Al-Qura University, Makkah',
      at: DateTime(2026, 6, 10, 13, 15),
    );

    expect(result, isA<Success<PrayerWindow>>());
    expect((result as Success<PrayerWindow>).value.next.id, 'asr');
    expect(result.value.remaining, const Duration(hours: 2, minutes: 14, seconds: 55));
  });
}
