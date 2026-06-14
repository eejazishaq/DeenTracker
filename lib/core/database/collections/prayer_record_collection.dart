import 'package:isar/isar.dart';

part 'prayer_record_collection.g.dart';

/// Daily prayer completion log entry.
@collection
class PrayerRecordCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String date;

  @Index()
  late String prayerName;

  /// One of [PrayerConstants.prayerStatuses].
  late String status;

  String? notes;

  late DateTime loggedAt;

  /// Prevents duplicate records for the same prayer on the same day.
  @Index(unique: true)
  late String compoundKey;
}
