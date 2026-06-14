import 'package:deentrack/core/database/collections/prayer_record_collection.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_record_repository.dart';
import 'package:isar/isar.dart';

class PrayerRecordRepositoryImpl implements PrayerRecordRepository {
  PrayerRecordRepositoryImpl(this._isar);

  final Isar _isar;

  @override
  Future<Result<String?>> getStatus({
    required String date,
    required String prayerName,
  }) async {
    try {
      final record = await _isar.prayerRecordCollections
          .filter()
          .compoundKeyEqualTo('$date::$prayerName')
          .findFirst();
      return Success(record?.status);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  @override
  Future<Result<void>> logPrayer({
    required String date,
    required String prayerName,
    required String status,
    String? notes,
  }) async {
    try {
      final key = '$date::$prayerName';
      await _isar.writeTxn(() async {
        final existing = await _isar.prayerRecordCollections
            .filter()
            .compoundKeyEqualTo(key)
            .findFirst();

        final record = PrayerRecordCollection()
          ..date = date
          ..prayerName = prayerName
          ..status = status
          ..notes = notes
          ..loggedAt = DateTime.now()
          ..compoundKey = key;

        if (existing != null) {
          record.id = existing.id;
        }
        await _isar.prayerRecordCollections.put(record);
      });
      return const Success(null);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  @override
  Future<Result<Map<String, String>>> getStatusesForDate(String date) async {
    try {
      final records = await _isar.prayerRecordCollections
          .filter()
          .dateEqualTo(date)
          .findAll();
      return Success({for (final r in records) r.prayerName: r.status});
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }
}
