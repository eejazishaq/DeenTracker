import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Compact current-prayer indicator aligned with Stitch dashboard semantics.
class StitchCurrentPrayerChip extends StatelessWidget {
  const StitchCurrentPrayerChip({
    required this.current,
    this.useArabicNames = false,
    super.key,
  });

  final PrayerSlot current;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    final name = useArabicNames ? current.arabicName : current.name;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D5C3A).withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF0D5C3A).withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'prayer_current_label'.tr(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFF0D5C3A),
                ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF0D5C3A),
                ),
          ),
        ],
      ),
    );
  }
}
