import 'package:equatable/equatable.dart';

/// Aggregated analytics for prayers, habits, and streaks.
class AnalyticsSummary extends Equatable {
  const AnalyticsSummary({
    required this.prayerCompletionRate,
    required this.habitCompletionRate,
    required this.currentPrayerStreak,
    required this.currentHabitStreak,
    required this.weeklyPrayerCounts,
    required this.monthlyPrayerCounts,
  });

  /// Percentage 0–100 over the tracked window.
  final double prayerCompletionRate;

  final double habitCompletionRate;
  final int currentPrayerStreak;
  final int currentHabitStreak;

  /// Last 7 days prayer completion counts.
  final List<int> weeklyPrayerCounts;

  /// Last 30 days prayer completion counts.
  final List<int> monthlyPrayerCounts;

  @override
  List<Object?> get props => [
        prayerCompletionRate,
        habitCompletionRate,
        currentPrayerStreak,
        currentHabitStreak,
        weeklyPrayerCounts,
        monthlyPrayerCounts,
      ];
}
