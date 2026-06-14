import 'package:isar/isar.dart';

part 'habit_record_collection.g.dart';

/// Daily habit completion record.
@collection
class HabitRecordCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late int habitId;

  @Index()
  late String date;

  late bool completed;

  late DateTime loggedAt;

  @Index(unique: true)
  late String compoundKey;
}
