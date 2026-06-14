import 'package:deentrack/core/errors/result.dart';

abstract interface class PrayerRecordRepository {
  Future<Result<String?>> getStatus({
    required String date,
    required String prayerName,
  });

  Future<Result<void>> logPrayer({
    required String date,
    required String prayerName,
    required String status,
    String? notes,
  });

  Future<Result<Map<String, String>>> getStatusesForDate(String date);
}
