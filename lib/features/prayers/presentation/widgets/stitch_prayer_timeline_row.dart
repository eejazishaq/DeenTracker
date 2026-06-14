import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:flutter/material.dart';

/// Horizontal five-prayer row matching Stitch HomeView checklist timeline.
class StitchPrayerTimelineRow extends StatelessWidget {
  const StitchPrayerTimelineRow({
    required this.schedule,
    required this.statuses,
    this.currentPrayerId,
    this.nextPrayerId,
    this.useArabicNames = false,
    super.key,
  });

  final PrayerSchedule schedule;
  final Map<String, String?> statuses;
  final String? currentPrayerId;
  final String? nextPrayerId;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: schedule.slots.map((slot) {
        final isNext = slot.id == nextPrayerId;
        final isCurrent = slot.id == currentPrayerId;
        final status = statuses[slot.id];
        final colors = _colorsForStatus(status, isCurrent, isNext);

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colors.border,
                  width: isNext || isCurrent ? 1.5 : 1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    useArabicNames ? slot.arabicName : slot.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.foreground,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    PrayerTimeFormatter.formatClockTime(
                      slot.time,
                      use24Hour: false,
                    ).split(' ').first,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 9,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.foreground),
                    ),
                    child: status == null
                        ? Center(
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.check,
                            size: 14,
                            color: const Color(0xFFFCD34D),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  _TimelineColors _colorsForStatus(
    String? status,
    bool isCurrent,
    bool isNext,
  ) {
    if (isNext) {
      return const _TimelineColors(
        background: Color(0x334D7C0F),
        border: Color(0xFFFCD34D),
        foreground: Color(0xFFFCD34D),
      );
    }
    if (isCurrent) {
      return const _TimelineColors(
        background: Color(0x3310B981),
        border: Color(0xFF34D399),
        foreground: Color(0xFF6EE7B7),
      );
    }

    return switch (status) {
      'completed' => const _TimelineColors(
        background: Color(0x3316A34A),
        border: Color(0xFF16A34A),
        foreground: Color(0xFF86EFAC),
      ),
      'late' => const _TimelineColors(
        background: Color(0x33D97706),
        border: Color(0xFFD97706),
        foreground: Color(0xFFFCD34D),
      ),
      'jamaah' => const _TimelineColors(
        background: Color(0x330D9488),
        border: Color(0xFF0D9488),
        foreground: Color(0xFF5EEAD4),
      ),
      'missed' => const _TimelineColors(
        background: Color(0x33DC2626),
        border: Color(0xFFDC2626),
        foreground: Color(0xFFFCA5A5),
      ),
      _ => const _TimelineColors(
        background: Color(0x661A2633),
        border: Color(0xFF475569),
        foreground: Color(0xFFCBD5E1),
      ),
    };
  }
}

class _TimelineColors {
  const _TimelineColors({
    required this.background,
    required this.border,
    required this.foreground,
  });

  final Color background;
  final Color border;
  final Color foreground;
}
