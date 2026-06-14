import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PrayerTimeFormatter', () {
    test('formats countdown as HH:MM:SS', () {
      expect(
        PrayerTimeFormatter.formatCountdown(
          const Duration(hours: 2, minutes: 14, seconds: 5),
        ),
        '02:14:05',
      );
    });

    test('formats 12-hour clock time', () {
      expect(
        PrayerTimeFormatter.formatClockTime(
          DateTime(2026, 6, 10, 16, 32),
          use24Hour: false,
        ),
        '4:32 PM',
      );
    });

    test('formats midnight as 12 AM', () {
      expect(
        PrayerTimeFormatter.formatClockTime(
          DateTime(2026, 6, 10, 0, 5),
          use24Hour: false,
        ),
        '12:05 AM',
      );
    });
  });
}
