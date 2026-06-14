import 'package:deentrack/core/constants/prayer_constants.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/features/prayers/presentation/providers/prayer_providers.dart';
import 'package:deentrack/features/prayers/presentation/providers/prayer_records_providers.dart';
import 'package:deentrack/features/prayers/presentation/widgets/stitch_current_prayer_chip.dart';
import 'package:deentrack/features/prayers/presentation/widgets/stitch_next_prayer_card.dart';
import 'package:deentrack/features/prayers/presentation/widgets/stitch_prayer_times_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrayersPage extends ConsumerWidget {
  const PrayersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(todayPrayerScheduleProvider);
    final prayerWindow = ref.watch(prayerWindowProvider);
    final statuses = ref.watch(prayerStatusesForSelectedDateProvider);
    final reminderEnabled = ref.watch(prayerReminderEnabledProvider);
    final soundEnabled = ref.watch(prayerSoundEnabledProvider);
    final vibrationEnabled = ref.watch(prayerVibrationEnabledProvider);
    final reminderOffset = ref.watch(prayerReminderOffsetMinutesProvider);
    final actionState = ref.watch(prayerRecordsControllerProvider);
    final useArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.deepEmerald,
        onPressed: () => _openReminderSheet(context),
        icon: const Icon(Icons.notifications_active, color: Colors.white),
        label: Text(
          'prayers_reminders'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: schedule.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text(error.toString())),
          data: (value) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prayerWindow.when(
                    data: (window) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (window.current != null) ...[
                          StitchCurrentPrayerChip(
                            current: window.current!,
                            useArabicNames: useArabic,
                          ),
                          const SizedBox(height: 12),
                        ],
                        StitchNextPrayerCard(
                          window: window,
                          useArabicNames: useArabic,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (error, stackTrace) => const SizedBox.shrink(),
                  ),
                  _ToggleTile(
                    icon: Icons.notifications_active_outlined,
                    label: 'prayers_reminder_enabled'.tr(),
                    value: reminderEnabled,
                    onChanged: (v) {
                      ref.read(prayerReminderEnabledProvider.notifier).state = v;
                    },
                  ),
                  _ToggleTile(
                    icon: Icons.music_note_outlined,
                    label: 'prayers_sound'.tr(),
                    value: soundEnabled,
                    onChanged: (v) {
                      ref.read(prayerSoundEnabledProvider.notifier).state = v;
                    },
                  ),
                  _ToggleTile(
                    icon: Icons.vibration_outlined,
                    label: 'prayers_vibration'.tr(),
                    value: vibrationEnabled,
                    onChanged: (v) {
                      ref.read(prayerVibrationEnabledProvider.notifier).state = v;
                    },
                  ),
                  const SizedBox(height: 8),
                  _ReminderBanner(minutes: reminderOffset),
                  const SizedBox(height: 16),
                  StitchPrayerTimesList(
                    schedule: value,
                    useArabicNames: useArabic,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'prayers_checklist'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  statuses.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Text(error.toString()),
                    data: (data) {
                      return Column(
                        children: value.slots
                            .map(
                              (slot) => _PrayerStatusCard(
                                slot: slot,
                                status: data[slot.id],
                                actionState: actionState,
                                onPick: (status) async {
                                  await ref
                                      .read(
                                        prayerRecordsControllerProvider.notifier,
                                      )
                                      .logPrayer(
                                        prayerName: slot.id,
                                        status: status,
                                      );
                                },
                                useArabicNames: useArabic,
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _openReminderSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Consumer(
          builder: (context, sheetRef, _) {
            final selected =
                sheetRef.watch(prayerReminderOffsetMinutesProvider);
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'prayers_reminder_sheet_title'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: PrayerConstants.reminderOffsetOptions
                        .map(
                          (value) => ChoiceChip(
                            label:
                                Text('prayers_before_min'.tr(args: ['$value'])),
                            selected: selected == value,
                            onSelected: (_) {
                              sheetRef
                                  .read(
                                    prayerReminderOffsetMinutesProvider.notifier,
                                  )
                                  .state = value;
                            },
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _PrayerStatusCard extends StatelessWidget {
  const _PrayerStatusCard({
    required this.slot,
    required this.status,
    required this.actionState,
    required this.onPick,
    required this.useArabicNames,
  });

  final PrayerSlot slot;
  final String? status;
  final AsyncValue<void> actionState;
  final Future<void> Function(String status) onPick;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    final displayName = useArabicNames ? slot.arabicName : slot.name;
    final selectedColor = switch (status) {
      'completed' => const Color(0xFF15803D),
      'jamaah' => const Color(0xFF2563EB),
      'masjid' => const Color(0xFF6D28D9),
      'late' => const Color(0xFFD97706),
      'qadha' => const Color(0xFFB45309),
      'missed' => const Color(0xFFDC2626),
      _ => Colors.grey.shade600,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.zinc900
            : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.zinc850
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(displayName, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  status == null
                      ? 'prayers_not_logged'.tr()
                      : 'prayers_status_$status'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: selectedColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            enabled: !actionState.isLoading,
            icon: const Icon(Icons.more_horiz),
            onSelected: onPick,
            itemBuilder: (context) => PrayerConstants.prayerStatuses
                .map(
                  (value) => PopupMenuItem(
                    value: value,
                    child: Text('prayers_status_$value'.tr()),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  const _ToggleTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.zinc900
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SwitchListTile.adaptive(
        value: value,
        onChanged: onChanged,
        secondary: Icon(icon),
        title: Text(label),
      ),
    );
  }
}

class _ReminderBanner extends StatelessWidget {
  const _ReminderBanner({required this.minutes});

  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF103E44), Color(0xFF1F2E3D)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'prayers_reminder_banner'.tr(args: ['$minutes']),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
