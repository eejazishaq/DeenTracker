import 'package:isar/isar.dart';

part 'habit_collection.g.dart';

/// User-defined or preset Islamic habit definition.
@collection
class HabitCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String title;

  String? description;
  String? arabicTitle;

  /// `quran`, `remembrance`, `night`, `charity`, or `custom`.
  @Index()
  late String category;

  /// Target completions per period (e.g. daily = 1).
  late int targetFrequency;

  late bool isDefault;

  String? iconName;
  String? emoji;
  String? color;

  /// Comma-separated weekday codes: S,M,T,W,T,F,S
  String? repeatDays;

  String? repeatFrequency;
  String? goal;

  late bool isActive;
  late DateTime createdAt;
}
