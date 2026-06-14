/// Application-wide constants.
abstract final class AppConstants {
  static const String appName = 'DeenTrack';

  /// Isar database file name.
  static const String databaseName = 'deentrack';

  /// Singleton row id for [UserSettingsCollection].
  static const int userSettingsId = 0;

  /// Kaaba coordinates used by Qibla calculations.
  static const double kaabaLatitude = 21.4225;
  static const double kaabaLongitude = 39.8262;

  /// Default location (Makkah) until GPS is configured.
  static const double defaultLatitude = kaabaLatitude;
  static const double defaultLongitude = kaabaLongitude;
  static const String defaultLocationName = 'Makkah, Saudi Arabia';

  static const String defaultCalculationMethod =
      'Umm Al-Qura University, Makkah';

  static const String defaultLanguageCode = 'en';
  static const String arabicLanguageCode = 'ar';

  /// Date format used for daily prayer and habit records.
  static const String dateRecordFormat = 'yyyy-MM-dd';
}
