import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/services/models/analytics_summary.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsSummaryProvider = FutureProvider<AnalyticsSummary>((ref) async {
  final result = await ref.read(analyticsServiceProvider).getSummary(
        endDate: DateTime.now(),
        days: 60,
      );
  return switch (result) {
    Success<AnalyticsSummary>(:final value) => value,
    FailureResult<AnalyticsSummary>(:final failure) => throw failure,
  };
});

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(analyticsSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('analytics_title'.tr())),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (summary) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              _MetricCard(
                title: 'analytics_prayer_rate'.tr(),
                value: '${summary.prayerCompletionRate.toStringAsFixed(1)}%',
              ),
              _MetricCard(
                title: 'analytics_habit_rate'.tr(),
                value: '${summary.habitCompletionRate.toStringAsFixed(1)}%',
              ),
              _MetricCard(
                title: 'analytics_prayer_streak'.tr(),
                value: summary.currentPrayerStreak.toString(),
              ),
              _MetricCard(
                title: 'analytics_habit_streak'.tr(),
                value: summary.currentHabitStreak.toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
