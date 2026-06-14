import 'package:deentrack/core/constants/app_constants.dart';
import 'package:isar/isar.dart';

part 'user_settings_collection.g.dart';

/// Singleton user preferences persisted locally.
@collection
class UserSettingsCollection {
  Id id = AppConstants.userSettingsId;

  /// `light`, `dark`, or `system`.
  late String themeMode;

  /// ISO language code: `en` or `ar`.
  late String language;

  /// Whether RTL layout is forced regardless of locale.
  late bool rtlEnabled;

  String? locationName;
  double? latitude;
  double? longitude;

  late String calculationMethod;

  /// Global azan volume 0–100.
  late int azanVolume;

  late bool vibrationOnReminder;

  /// `normal`, `large`, or `extra-large`.
  late String textSize;

  /// Whether onboarding has been completed.
  late bool onboardingCompleted;

  /// Timestamp of last settings mutation for sync/debug.
  late DateTime updatedAt;

  UserSettingsCollection();

  factory UserSettingsCollection.defaults() {
    return UserSettingsCollection()
      ..themeMode = 'system'
      ..language = AppConstants.defaultLanguageCode
      ..rtlEnabled = false
      ..locationName = AppConstants.defaultLocationName
      ..latitude = AppConstants.defaultLatitude
      ..longitude = AppConstants.defaultLongitude
      ..calculationMethod = AppConstants.defaultCalculationMethod
      ..azanVolume = 80
      ..vibrationOnReminder = true
      ..textSize = 'normal'
      ..onboardingCompleted = false
      ..updatedAt = DateTime.now();
  }
}
