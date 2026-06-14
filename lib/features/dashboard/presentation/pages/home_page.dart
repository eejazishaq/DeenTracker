import 'package:deentrack/core/constants/route_paths.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/features/prayers/presentation/providers/prayer_providers.dart';
import 'package:deentrack/features/prayers/presentation/providers/prayer_records_providers.dart';
import 'package:deentrack/features/prayers/presentation/widgets/stitch_prayer_timeline_row.dart';
import 'package:deentrack/features/prayers/presentation/widgets/stitch_prayer_times_list.dart';
import 'package:deentrack/features/dashboard/presentation/widgets/nusuk_home_hero_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayerWindow = ref.watch(prayerWindowProvider);
    final settings = ref.watch(prayerEngineSettingsProvider);
    final schedule = ref.watch(todayPrayerScheduleProvider);
    final statuses = ref.watch(prayerStatusesForSelectedDateProvider);
    final useArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: Colors.white,
      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NusukHomeHeroSection(
                  prayerWindow: prayerWindow,
                  useArabicNames: useArabic,
                  onPrayerTimes: () => context.go(RoutePaths.prayers),
                  onPrayerTracker: () => context.go(RoutePaths.prayers),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      prayerWindow.when(
                    loading: () => const SizedBox.shrink(),
                    error: (error, _) => Text(error.toString()),
                    data: (window) {
                      return schedule.when(
                        loading: () => const SizedBox.shrink(),
                        error: (error, _) => const SizedBox.shrink(),
                        data: (daily) => statuses.when(
                          loading: () => const SizedBox.shrink(),
                          error: (error, _) => const SizedBox.shrink(),
                          data: (map) => _PrayerTimelineSection(
                            schedule: daily,
                            statuses: map,
                            currentPrayerId: window.current?.id,
                            nextPrayerId: window.next.id,
                            useArabicNames: useArabic,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  schedule.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Text(error.toString()),
                    data: (daily) => StitchPrayerTimesList(
                      schedule: daily,
                      useArabicNames: useArabic,
                    ),
                  ),
                  const SizedBox(height: 18),
                      _ShortcutGrid(
                        onQibla: () => context.push(RoutePaths.qibla),
                        onCalendar: () => context.push(RoutePaths.calendar),
                        onAnalytics: () => context.push(RoutePaths.analytics),
                        onSettings: () => context.go(RoutePaths.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PrayerTimelineSection extends StatelessWidget {
  const _PrayerTimelineSection({
    required this.schedule,
    required this.statuses,
    required this.currentPrayerId,
    required this.nextPrayerId,
    required this.useArabicNames,
  });

  final PrayerSchedule schedule;
  final Map<String, String?> statuses;
  final String? currentPrayerId;
  final String nextPrayerId;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.zinc900
            : const Color(0xFF1A2633),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.zinc850
              : const Color(0xFF334155).withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home_checklist'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.grey.shade300,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                'home_schedules_checked'.tr(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFFFCD34D),
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          StitchPrayerTimelineRow(
            schedule: schedule,
            statuses: statuses,
            currentPrayerId: currentPrayerId,
            nextPrayerId: nextPrayerId,
            useArabicNames: useArabicNames,
          ),
        ],
      ),
    );
  }
}

class _ShortcutGrid extends StatelessWidget {
  const _ShortcutGrid({
    required this.onQibla,
    required this.onCalendar,
    required this.onAnalytics,
    required this.onSettings,
  });

  final VoidCallback onQibla;
  final VoidCallback onCalendar;
  final VoidCallback onAnalytics;
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _ShortcutTile(
          icon: Icons.explore_outlined,
          title: 'menu_qibla'.tr(),
          onTap: onQibla,
        ),
        _ShortcutTile(
          icon: Icons.event_note_outlined,
          title: 'menu_calendar'.tr(),
          onTap: onCalendar,
        ),
        _ShortcutTile(
          icon: Icons.query_stats_outlined,
          title: 'menu_analytics'.tr(),
          onTap: onAnalytics,
        ),
        _ShortcutTile(
          icon: Icons.settings_outlined,
          title: 'menu_settings'.tr(),
          onTap: onSettings,
        ),
      ],
    );
  }
}

class _ShortcutTile extends StatelessWidget {
  const _ShortcutTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.zinc900
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.deepEmerald),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}