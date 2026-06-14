import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/analytics_summary.dart';

/// Aggregates prayer and habit data from local storage for dashboards.
abstract interface class AnalyticsService {
  /// Builds a summary for the last [days] days ending on [endDate].
  Future<Result<AnalyticsSummary>> getSummary({
    required DateTime endDate,
    int days = 60,
  });

  /// Returns daily prayer completion counts for heatmap rendering.
  Future<Result<List<DailyCompletion>>> getPrayerHeatmap({
    required DateTime endDate,
    int days = 60,
  });

  /// Returns daily habit completion counts for heatmap rendering.
  Future<Result<List<DailyCompletion>>> getHabitHeatmap({
    required DateTime endDate,
    int days = 60,
  });
}

/// Single day completion metric for chart and heatmap widgets.
class DailyCompletion {
  const DailyCompletion({
    required this.date,
    required this.completedCount,
    required this.totalCount,
  });

  final DateTime date;
  final int completedCount;
  final int totalCount;

  double get completionRate =>
      totalCount == 0 ? 0 : completedCount / totalCount;
}
