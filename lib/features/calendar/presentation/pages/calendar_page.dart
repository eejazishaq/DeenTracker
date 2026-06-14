import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/services/interfaces/hijri_calendar_service.dart';
import 'package:deentrack/shared/utils/hijri_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final upcomingIslamicEventsProvider = FutureProvider<List<IslamicEventData>>(
  (ref) async {
    final result = await ref.read(hijriCalendarServiceProvider).getUpcomingEvents(
          from: DateTime.now(),
          daysAhead: 365,
        );
    return switch (result) {
      Success<List<IslamicEventData>>(:final value) => value,
      FailureResult<List<IslamicEventData>>(:final failure) => throw failure,
    };
  },
);

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(upcomingIslamicEventsProvider);
    final arabic = context.locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(title: Text('calendar_title'.tr())),
      body: eventsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (events) => ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: Text(arabic ? event.arabicTitle : event.title),
                subtitle: Text(
                  '${DateFormat.yMMMMd(context.locale.languageCode).format(event.gregorianDate)}\n'
                  '${HijriUtils.formatDisplay(event.gregorianDate, arabic: arabic)}',
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
