import 'package:deentrack/core/database/collections/prayer_record_collection.dart';
import 'package:isar/isar.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/features/prayers/data/repositories/prayer_record_repository_impl.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_record_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final prayerRecordRepositoryProvider = Provider<PrayerRecordRepository>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return PrayerRecordRepositoryImpl(isar);
});

final selectedPrayerDateProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);

final prayerRecordRevisionProvider = StateProvider<int>((ref) => 0);

void bumpPrayerRecordRevision(Ref ref) {
  ref.read(prayerRecordRevisionProvider.notifier).state++;
}

final prayerStatusesForSelectedDateProvider =
    FutureProvider<Map<String, String>>((ref) async {
  ref.watch(prayerRecordRevisionProvider);
  final date = ref.watch(selectedPrayerDateProvider);
  final repo = ref.watch(prayerRecordRepositoryProvider);

  final result = await repo.getStatusesForDate(_dateKey(date));
  return switch (result) {
    Success<Map<String, String>>(:final value) => value,
    FailureResult<Map<String, String>>(:final failure) => throw failure,
  };
});

final prayerRecordsForSelectedDateProvider =
    FutureProvider<List<PrayerRecordCollection>>((ref) async {
  ref.watch(prayerRecordRevisionProvider);
  final isar = ref.watch(isarProvider).requireValue;
  final date = ref.watch(selectedPrayerDateProvider);
  return await isar.prayerRecordCollections
      .filter()
      .dateEqualTo(_dateKey(date))
      .findAll();
});

final prayerReminderOffsetMinutesProvider = StateProvider<int>((ref) => 10);
final prayerReminderEnabledProvider = StateProvider<bool>((ref) => true);
final prayerSoundEnabledProvider = StateProvider<bool>((ref) => true);
final prayerVibrationEnabledProvider = StateProvider<bool>((ref) => true);

final prayerRecordsControllerProvider =
    AsyncNotifierProvider<PrayerRecordsController, void>(
  PrayerRecordsController.new,
);

class PrayerRecordsController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> logPrayer({
    required String prayerName,
    required String status,
    String? notes,
  }) async {
    state = const AsyncLoading<void>();
    final repo = ref.read(prayerRecordRepositoryProvider);
    final date = ref.read(selectedPrayerDateProvider);

    final result = await repo.logPrayer(
      date: _dateKey(date),
      prayerName: prayerName,
      status: status,
      notes: notes,
    );

    switch (result) {
      case Success<void>():
        state = const AsyncData(null);
        bumpPrayerRecordRevision(ref);
      case FailureResult<void>(:final failure):
        state = AsyncError<void>(failure, StackTrace.current);
    }
  }
}

String _dateKey(DateTime date) {
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '${date.year}-$month-$day';
}
