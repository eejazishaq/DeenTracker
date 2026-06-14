/// Prayer-related domain constants shared across layers.
abstract final class PrayerConstants {
  static const List<String> prayerIds = [
    'fajr',
    'dhuhr',
    'asr',
    'maghrib',
    'isha',
  ];

  static const List<String> prayerStatuses = [
    'completed',
    'late',
    'jamaah',
    'masjid',
    'qadha',
    'missed',
  ];

  static const List<String> calculationMethods = [
    'Umm Al-Qura University, Makkah',
    'Muslim World League (MWL)',
    'Islamic Society of North America (ISNA)',
    'Egyptian General Authority of Survey',
    'University of Islamic Sciences, Karachi',
  ];

  static const List<int> reminderOffsetOptions = [0, 5, 15, 30, 45];
}
