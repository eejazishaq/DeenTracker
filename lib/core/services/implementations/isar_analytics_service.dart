import 'package:deentrack/core/constants/prayer_constants.dart';
import 'package:deentrack/core/database/collections/habit_collection.dart';
import 'package:deentrack/core/database/collections/habit_record_collection.dart';
import 'package:deentrack/core/database/collections/prayer_record_collection.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/analytics_service.dart';
import 'package:deentrack/core/services/models/analytics_summary.dart';
import 'package:isar/isar.dart';

class IsarAnalyticsService implements AnalyticsService {
  IsarAnalyticsService(this._isar);

  final Isar _isar;

  @override
  Future<Result<AnalyticsSummary>> getSummary({
    required DateTime endDate,
    int days = 60,
  }) async {
    try {
      final heatmap = await getPrayerHeatmap(endDate: endDate, days: days);
      final habitHeatmap = await getHabitHeatmap(endDate: endDate, days: days);
      if (heatmap case FailureResult(:final failure)) {
        return FailureResult(failure);
      }
      if (habitHeatmap case FailureResult(:final failure)) {
        return FailureResult(failure);
      }

      final prayers = (heatmap as Success).value as List<DailyCompletion>;
      final habits = (habitHeatmap as Success).value as List<DailyCompletion>;

      final prayerTotal = prayers.fold<int>(0, (s, d) => s + d.completedCount);
      final habitTotal = habits.fold<int>(0, (s, d) => s + d.completedCount);
      final prayerMax = days * PrayerConstants.prayerIds.length;
      final habitMax = habits.fold<int>(0, (s, d) => s + d.totalCount);

      return Success(
        AnalyticsSummary(
          prayerCompletionRate:
              prayerMax == 0 ? 0 : (prayerTotal / prayerMax) * 100,
          habitCompletionRate:
              habitMax == 0 ? 0 : (habitTotal / habitMax) * 100,
          currentPrayerStreak: _streak(prayers),
          currentHabitStreak: _streak(habits),
          weeklyPrayerCounts: prayers.length >= 7
              ? prayers.sublist(prayers.length - 7).map((e) => e.completedCount).toList()
              : prayers.map((e) => e.completedCount).toList(),
          monthlyPrayerCounts: prayers.map((e) => e.completedCount).toList(),
        ),
      );
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  @override
  Future<Result<List<DailyCompletion>>> getPrayerHeatmap({
    required DateTime endDate,
    int days = 60,
  }) async {
    try {
      final results = <DailyCompletion>[];
      for (var i = days - 1; i >= 0; i--) {
        final date = endDate.subtract(Duration(days: i));
        final key = _dateKey(date);
        final count = await _isar.prayerRecordCollections
            .filter()
            .dateEqualTo(key)
            .count();
        results.add(
          DailyCompletion(
            date: DateTime(date.year, date.month, date.day),
            completedCount: count,
            totalCount: PrayerConstants.prayerIds.length,
          ),
        );
      }
      return Success(results);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  @override
  Future<Result<List<DailyCompletion>>> getHabitHeatmap({
    required DateTime endDate,
    int days = 60,
  }) async {
    try {
      final habitCount = await _isar.habitCollections.filter().isActiveEqualTo(true).count();
      final total = habitCount == 0 ? 6 : habitCount;
      final results = <DailyCompletion>[];

      for (var i = days - 1; i >= 0; i--) {
        final date = endDate.subtract(Duration(days: i));
        final key = _dateKey(date);
        final completed = await _isar.habitRecordCollections
            .filter()
            .dateEqualTo(key)
            .completedEqualTo(true)
            .count();
        results.add(
          DailyCompletion(
            date: DateTime(date.year, date.month, date.day),
            completedCount: completed,
            totalCount: total,
          ),
        );
      }
      return Success(results);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  int _streak(List<DailyCompletion> days) {
    var streak = 0;
    for (final day in days.reversed) {
      if (day.completedCount > 0) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  String _dateKey(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }
}
