import 'package:isar/isar.dart';

part 'islamic_event_collection.g.dart';

/// Islamic calendar event for Hijri calendar feature.
@collection
class IslamicEventCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String title;

  String? arabicTitle;
  String? description;

  /// Gregorian date key: `yyyy-MM-dd`.
  @Index()
  late String gregorianDate;

  late String hijriDate;

  /// `fasting`, `holiday`, or `night`.
  @Index()
  late String type;

  late bool isRecurring;
}
