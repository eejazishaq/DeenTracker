import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/theme/app_text_styles.dart';
import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Read-only prayer timetable rows matching Stitch PrayersView time styling.
class StitchPrayerTimesList extends StatelessWidget {
  const StitchPrayerTimesList({
    required this.schedule,
    this.useArabicNames = false,
    super.key,
  });

  final PrayerSchedule schedule;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'prayer_salah_companion'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          'prayer_salah_companion_subtitle'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        ...schedule.slots.map(
          (slot) => _PrayerTimeRow(
            slot: slot,
            useArabicNames: useArabicNames,
          ),
        ),
      ],
    );
  }
}

class _PrayerTimeRow extends StatelessWidget {
  const _PrayerTimeRow({
    required this.slot,
    required this.useArabicNames,
  });

  final PrayerSlot slot;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final label = useArabicNames ? slot.arabicName : slot.name;
    final timeLabel = PrayerTimeFormatter.formatClockTime(
      slot.time,
      use24Hour: false,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF18181B) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? const Color(0xFF27272A) : Colors.grey.shade100,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF27272A) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.access_time,
              size: 18,
              color: Color(0xFF103E44),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                color: const Color(0xFF0D5C3A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            timeLabel,
            style: AppTextStyles.countdown(
              brightness: theme.brightness,
              scaleFactor: 0.75,
            ).copyWith(
              color: const Color(0xFFD97706),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
