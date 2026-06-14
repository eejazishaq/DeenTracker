import 'package:deentrack/core/services/models/hijri_date.dart';
import 'package:hijri_date/hijri_date.dart' as hijri;

/// Hijri conversion using Umm al-Qura data via [hijri_date].
abstract final class HijriUtils {
  static const Map<int, String> _nusukEnglishMonths = {
    1: 'Muharram',
    2: 'Safar',
    3: "Rabi' al-Awwal",
    4: "Rabi' al-Thani",
    5: 'Jumada al-Ula',
    6: 'Jumada al-Akhirah',
    7: 'Rajab',
    8: "Sha'ban",
    9: 'Ramadan',
    10: 'Shawwal',
    11: "Dhu al-Qa'dah",
    12: 'Dhul Hijjah',
  };

  static HijriDate toHijri(DateTime date) {
    final english = hijri.HijriDate.fromDate(date);
    hijri.HijriDate.setLocal('ar');
    final arabic = hijri.HijriDate.fromDate(date);

    return HijriDate(
      day: english.hDay,
      month: _nusukEnglishMonths[english.hMonth] ?? english.longMonthName,
      monthArabic: arabic.longMonthName,
      year: english.hYear,
    );
  }

  static String formatDisplay(DateTime gregorian, {required bool arabic}) {
    hijri.HijriDate.setLocal(arabic ? 'ar' : 'en');
    final h = hijri.HijriDate.fromDate(gregorian);

    if (arabic) {
      return '${h.hDay} ${h.longMonthName} ${h.hYear}';
    }

    final month = _nusukEnglishMonths[h.hMonth] ?? h.longMonthName;
    return '${h.hDay} $month ${h.hYear}';
  }
}
