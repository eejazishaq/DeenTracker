import 'package:isar/isar.dart';

part 'prayer_time_collection.g.dart';

/// Cached daily prayer schedule for a single Gregorian date.
@collection
class PrayerTimeCollection {
  Id id = Isar.autoIncrement;

  /// Gregorian date key: `yyyy-MM-dd`.
  @Index(unique: true)
  late String date;

  late DateTime fajr;
  late DateTime sunrise;
  late DateTime dhuhr;
  late DateTime asr;
  late DateTime maghrib;
  late DateTime isha;

  /// Calculation method used when this row was generated.
  late String calculationMethod;

  late double latitude;
  late double longitude;

  late DateTime createdAt;
}
