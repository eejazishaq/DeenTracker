import 'package:isar/isar.dart';

part 'notification_setting_collection.g.dart';

/// Per-prayer notification and azan preferences.
@collection
class NotificationSettingCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String prayerName;

  late bool enabled;
  late int offsetMinutes;

  /// Asset key or file name for azan audio.
  String? azanAudio;

  late int volume;

  late bool vibrationEnabled;
}
