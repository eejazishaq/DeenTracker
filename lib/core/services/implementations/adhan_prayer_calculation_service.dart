import 'package:adhan/adhan.dart';
import 'package:deentrack/core/constants/prayer_constants.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/prayer_calculation_service.dart';
import 'package:deentrack/core/services/mappers/calculation_method_mapper.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';

/// [PrayerCalculationService] backed by the `adhan` astronomical library.
class AdhanPrayerCalculationService implements PrayerCalculationService {
  const AdhanPrayerCalculationService();

  @override
  Future<Result<PrayerSchedule>> calculateDailySchedule({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) async {
    try {
      _validateCoordinates(latitude, longitude);

      final coordinates = Coordinates(latitude, longitude);
      final components = DateComponents(date.year, date.month, date.day);
      final params = CalculationMethodMapper.parametersFor(calculationMethod);

      final prayerTimes = PrayerTimes(coordinates, components, params);
      final normalizedDate = DateTime(date.year, date.month, date.day);

      return Success(
        PrayerSchedule(
          date: normalizedDate,
          fajr: prayerTimes.fajr,
          sunrise: prayerTimes.sunrise,
          dhuhr: prayerTimes.dhuhr,
          asr: prayerTimes.asr,
          maghrib: prayerTimes.maghrib,
          isha: prayerTimes.isha,
          calculationMethod: calculationMethod,
          latitude: latitude,
          longitude: longitude,
        ),
      );
    } catch (error) {
      return FailureResult(
        PrayerCalculationFailure(
          message: 'Failed to calculate prayer times.',
          cause: error,
        ),
      );
    }
  }

  @override
  Future<Result<PrayerWindow>> getPrayerWindow({
    required PrayerSchedule schedule,
    DateTime? at,
    PrayerSchedule? nextDaySchedule,
  }) async {
    try {
      final now = at ?? DateTime.now();
      final timeline = _buildTimeline(
        schedule: schedule,
        nextDaySchedule: nextDaySchedule,
      );

      if (timeline.isEmpty) {
        return const FailureResult(
          PrayerCalculationFailure(message: 'Prayer timeline is empty.'),
        );
      }

      final upcomingIndex = timeline.indexWhere((slot) => slot.time.isAfter(now));
      final PrayerSlot next;
      final PrayerSlot? current;

      if (upcomingIndex == -1) {
        current = timeline.isNotEmpty ? timeline.last : null;
        next = timeline.first;
      } else {
        next = timeline[upcomingIndex];
        current = upcomingIndex > 0 ? timeline[upcomingIndex - 1] : null;
      }

      var targetTime = next.time;
      if (!targetTime.isAfter(now)) {
        targetTime = targetTime.add(const Duration(days: 1));
      }

      final remaining = targetTime.difference(now);
      final progress = _calculateProgress(
        now: now,
        current: current,
        targetTime: targetTime,
        remaining: remaining,
      );

      return Success(
        PrayerWindow(
          current: current,
          next: next,
          remaining: remaining,
          progress: progress,
        ),
      );
    } catch (error) {
      return FailureResult(
        PrayerCalculationFailure(
          message: 'Failed to resolve prayer window.',
          cause: error,
        ),
      );
    }
  }

  static void _validateCoordinates(double latitude, double longitude) {
    if (latitude < -90 || latitude > 90) {
      throw ArgumentError.value(latitude, 'latitude', 'Must be between -90 and 90.');
    }
    if (longitude < -180 || longitude > 180) {
      throw ArgumentError.value(
        longitude,
        'longitude',
        'Must be between -180 and 180.',
      );
    }
  }

  static List<PrayerSlot> _buildTimeline({
    required PrayerSchedule schedule,
    PrayerSchedule? nextDaySchedule,
  }) {
    final timeline = List<PrayerSlot>.from(schedule.slots)
      ..sort((a, b) => a.time.compareTo(b.time));

    if (nextDaySchedule != null) {
      final nextFajr = nextDaySchedule.slots.firstWhere(
        (slot) => slot.id == PrayerConstants.prayerIds.first,
      );
      timeline.add(nextFajr);
    }

    return timeline;
  }

  static double _calculateProgress({
    required DateTime now,
    required PrayerSlot? current,
    required DateTime targetTime,
    required Duration remaining,
  }) {
    if (current != null) {
      final totalMs = targetTime.difference(current.time).inMilliseconds;
      if (totalMs <= 0) {
        return 0;
      }
      final elapsedMs = now.difference(current.time).inMilliseconds;
      return (elapsedMs / totalMs * 100).clamp(0, 100).toDouble();
    }

    // Stitch HomeView uses an approximate 6-hour block when no current prayer.
    const blockMs = 6 * 60 * 60 * 1000;
    return (100 - (remaining.inMilliseconds / blockMs * 100))
        .clamp(0, 100)
        .toDouble();
  }
}
