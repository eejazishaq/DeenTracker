import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/hijri_calendar_service.dart';
import 'package:deentrack/core/services/models/hijri_date.dart';
import 'package:deentrack/shared/data/islamic_events_data.dart';
import 'package:deentrack/shared/utils/hijri_utils.dart';

class LocalHijriCalendarService implements HijriCalendarService {
  @override
  Result<HijriDate> toHijri(DateTime date) {
    return Success(HijriUtils.toHijri(date));
  }

  @override
  Future<Result<List<IslamicEventData>>> getUpcomingEvents({
    required DateTime from,
    int daysAhead = 365,
  }) async {
    final end = from.add(Duration(days: daysAhead));
    final events = IslamicEventsData.preset
        .where((e) => !e.gregorianDate.isBefore(from) && !e.gregorianDate.isAfter(end))
        .toList()
      ..sort((a, b) => a.gregorianDate.compareTo(b.gregorianDate));
    return Success(events);
  }

  @override
  Future<Result<void>> syncEventCatalog() async => const Success(null);
}
