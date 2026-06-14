import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/implementations/adhan_prayer_calculation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const service = AdhanPrayerCalculationService();

  group('AdhanPrayerCalculationService', () {
    test('calculates daily schedule for Makkah', () async {
      final result = await service.calculateDailySchedule(
        date: DateTime(2026, 6, 10),
        latitude: 21.4225,
        longitude: 39.8262,
        calculationMethod: 'Umm Al-Qura University, Makkah',
      );

      expect(result, isA<Success>());
      final schedule = (result as Success).value;

      expect(schedule.fajr, isNotNull);
      expect(schedule.dhuhr, isNotNull);
      expect(schedule.maghrib, isNotNull);
      expect(schedule.fajr.isBefore(schedule.sunrise), isTrue);
      expect(schedule.sunrise.isBefore(schedule.dhuhr), isTrue);
      expect(schedule.dhuhr.isBefore(schedule.asr), isTrue);
      expect(schedule.asr.isBefore(schedule.maghrib), isTrue);
      expect(schedule.maghrib.isBefore(schedule.isha), isTrue);
    });

    test('rejects invalid latitude', () async {
      final result = await service.calculateDailySchedule(
        date: DateTime(2026, 6, 10),
        latitude: 120,
        longitude: 39.8262,
        calculationMethod: 'Umm Al-Qura University, Makkah',
      );

      expect(result, isA<FailureResult>());
    });

    test('resolves next prayer and remaining time', () async {
      final scheduleResult = await service.calculateDailySchedule(
        date: DateTime(2026, 6, 10),
        latitude: 21.4225,
        longitude: 39.8262,
        calculationMethod: 'Muslim World League (MWL)',
      );
      final schedule = (scheduleResult as Success).value;

      final windowResult = await service.getPrayerWindow(
        schedule: schedule,
        at: DateTime(
          schedule.date.year,
          schedule.date.month,
          schedule.date.day,
          10,
          0,
        ),
      );

      expect(windowResult, isA<Success>());
      final window = (windowResult as Success).value;

      expect(window.next.id, 'dhuhr');
      expect(window.remaining.inMinutes, greaterThan(0));
      expect(window.progress, inInclusiveRange(0, 100));
    });

    test('wraps to next day fajr after isha', () async {
      final today = await service.calculateDailySchedule(
        date: DateTime(2026, 6, 10),
        latitude: 21.4225,
        longitude: 39.8262,
        calculationMethod: 'Umm Al-Qura University, Makkah',
      );
      final tomorrow = await service.calculateDailySchedule(
        date: DateTime(2026, 6, 11),
        latitude: 21.4225,
        longitude: 39.8262,
        calculationMethod: 'Umm Al-Qura University, Makkah',
      );

      final windowResult = await service.getPrayerWindow(
        schedule: (today as Success).value,
        nextDaySchedule: (tomorrow as Success).value,
        at: DateTime(2026, 6, 10, 23, 30),
      );

      final window = (windowResult as Success).value;
      expect(window.next.id, 'fajr');
      expect(window.remaining.inHours, lessThan(12));
    });
  });
}
