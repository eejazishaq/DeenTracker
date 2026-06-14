import 'package:deentrack/core/services/interfaces/hijri_calendar_service.dart';

/// Seed Islamic events from Stitch mockData.
abstract final class IslamicEventsData {
  static final List<IslamicEventData> preset = [
    IslamicEventData(
      id: 'isra_miraj',
      title: "Isra' and Mi'raj",
      arabicTitle: 'الإسراء والمعراج',
      gregorianDate: DateTime(2026, 2, 15),
      hijriDate: '27 Rajab 1447',
      type: 'night',
    ),
    IslamicEventData(
      id: 'ramadan_start',
      title: 'Ramadan Begins',
      arabicTitle: 'بداية رمضان',
      gregorianDate: DateTime(2026, 2, 18),
      hijriDate: '1 Ramadan 1447',
      type: 'fasting',
    ),
    IslamicEventData(
      id: 'laylat_qadr',
      title: 'Laylat al-Qadr',
      arabicTitle: 'ليلة القدر',
      gregorianDate: DateTime(2026, 3, 15),
      hijriDate: '27 Ramadan 1447',
      type: 'night',
    ),
    IslamicEventData(
      id: 'eid_fitr',
      title: 'Eid al-Fitr',
      arabicTitle: 'عيد الفطر',
      gregorianDate: DateTime(2026, 3, 20),
      hijriDate: '1 Shawwal 1447',
      type: 'holiday',
    ),
    IslamicEventData(
      id: 'hajj_start',
      title: 'Hajj Season Starts',
      arabicTitle: 'بداية موسم الحج',
      gregorianDate: DateTime(2026, 5, 18),
      hijriDate: '1 Dhu al-Hijjah 1447',
      type: 'fasting',
    ),
    IslamicEventData(
      id: 'day_arafah',
      title: 'Day of Arafah',
      arabicTitle: 'يوم عرفة',
      gregorianDate: DateTime(2026, 5, 26),
      hijriDate: '9 Dhu al-Hijjah 1447',
      type: 'fasting',
    ),
    IslamicEventData(
      id: 'eid_adha',
      title: 'Eid al-Adha',
      arabicTitle: 'عيد الأضحى',
      gregorianDate: DateTime(2026, 5, 27),
      hijriDate: '10 Dhu al-Hijjah 1447',
      type: 'holiday',
    ),
    IslamicEventData(
      id: 'islamic_new_year',
      title: 'Islamic New Year',
      arabicTitle: 'رأس السنة الهجرية',
      gregorianDate: DateTime(2026, 6, 16),
      hijriDate: '1 Muharram 1448',
      type: 'holiday',
    ),
  ];
}
