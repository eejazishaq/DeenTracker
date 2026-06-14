import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';

/// Loads the prayer timetable for a specific day.
class GetDailyPrayerScheduleUseCase {
  const GetDailyPrayerScheduleUseCase(this._repository);

  final PrayerScheduleRepository _repository;

  Future<Result<PrayerSchedule>> call({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String calculationMethod,
  }) {
    return _repository.getScheduleForDate(
      date: date,
      latitude: latitude,
      longitude: longitude,
      calculationMethod: calculationMethod,
    );
  }
}
