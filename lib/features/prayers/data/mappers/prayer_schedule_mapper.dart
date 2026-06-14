import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/database/collections/prayer_time_collection.dart';

/// Maps between Isar collections and domain prayer schedule models.
abstract final class PrayerScheduleMapper {
  static PrayerSchedule fromCollection(PrayerTimeCollection collection) {
    final parts = collection.date.split('-');
    final date = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );

    return PrayerSchedule(
      date: date,
      fajr: collection.fajr,
      sunrise: collection.sunrise,
      dhuhr: collection.dhuhr,
      asr: collection.asr,
      maghrib: collection.maghrib,
      isha: collection.isha,
      calculationMethod: collection.calculationMethod,
      latitude: collection.latitude,
      longitude: collection.longitude,
    );
  }

  static PrayerTimeCollection toCollection(PrayerSchedule schedule) {
    return PrayerTimeCollection()
      ..date = _formatDate(schedule.date)
      ..fajr = schedule.fajr
      ..sunrise = schedule.sunrise
      ..dhuhr = schedule.dhuhr
      ..asr = schedule.asr
      ..maghrib = schedule.maghrib
      ..isha = schedule.isha
      ..calculationMethod = schedule.calculationMethod
      ..latitude = schedule.latitude
      ..longitude = schedule.longitude
      ..createdAt = DateTime.now();
  }

  static String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  static String dateKey(DateTime date) => _formatDate(
        DateTime(date.year, date.month, date.day),
      );
}
