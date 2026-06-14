import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/hijri_date.dart';

/// Converts Gregorian dates and provides Islamic event metadata.
abstract interface class HijriCalendarService {
  /// Converts a Gregorian [date] to its Hijri equivalent.
  Result<HijriDate> toHijri(DateTime date);

  /// Returns upcoming Islamic events within [daysAhead] from [from].
  Future<Result<List<IslamicEventData>>> getUpcomingEvents({
    required DateTime from,
    int daysAhead = 365,
  });

  /// Seeds or refreshes the local Islamic events catalog.
  Future<Result<void>> syncEventCatalog();
}

/// Lightweight event DTO used by the calendar service interface.
class IslamicEventData {
  const IslamicEventData({
    required this.id,
    required this.title,
    required this.arabicTitle,
    required this.gregorianDate,
    required this.hijriDate,
    required this.type,
    this.description,
  });

  final String id;
  final String title;
  final String arabicTitle;
  final DateTime gregorianDate;
  final String hijriDate;
  final String type;
  final String? description;
}
