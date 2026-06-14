import 'package:deentrack/shared/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Glass-style service shortcuts inside the Qibla arc (Nusuk reference).
class NusukServiceCards extends StatelessWidget {
  const NusukServiceCards({
    required this.onPrayerTimes,
    required this.onPrayerTracker,
    this.compact = false,
    this.insideArc = false,
    super.key,
  });

  final VoidCallback onPrayerTimes;
  final VoidCallback onPrayerTracker;
  final bool compact;
  final bool insideArc;

  @override
  Widget build(BuildContext context) {
    if (insideArc) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ServiceCard(
            icon: Icons.access_time_rounded,
            label: HomeServiceLabels.prayerTimesShort(context),
            onTap: onPrayerTimes,
            insideArc: true,
          ),
          const SizedBox(width: 10),
          _ServiceCard(
            icon: Icons.checklist_rounded,
            label: HomeServiceLabels.prayerTrackerShort(context),
            onTap: onPrayerTracker,
            insideArc: true,
          ),
        ],
      );
    }

    final timesLabel = HomeServiceLabels.prayerTimes(context);
    final trackerLabel = HomeServiceLabels.prayerTracker(context);

    if (compact) {
      return Row(
        children: [
          Expanded(
            child: _ServiceCard(
              icon: Icons.access_time_rounded,
              label: timesLabel,
              onTap: onPrayerTimes,
              compact: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ServiceCard(
              icon: Icons.checklist_rounded,
              label: trackerLabel,
              onTap: onPrayerTracker,
              compact: true,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _ServiceCard(
            icon: Icons.access_time_rounded,
            label: timesLabel,
            onTap: onPrayerTimes,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ServiceCard(
            icon: Icons.checklist_rounded,
            label: trackerLabel,
            onTap: onPrayerTracker,
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.compact = false,
    this.insideArc = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool compact;
  final bool insideArc;

  @override
  Widget build(BuildContext context) {
    final height = insideArc ? 62.0 : (compact ? 84.0 : 88.0);
    final width = insideArc ? 76.0 : null;
    final radius = insideArc ? 14.0 : (compact ? 16.0 : 18.0);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.11),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: insideArc ? 4 : 6,
              vertical: insideArc ? 6 : 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white.withValues(alpha: 0.92),
                  size: insideArc ? 20 : (compact ? 24 : 26),
                ),
                SizedBox(height: insideArc ? 4 : (compact ? 6 : 8)),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontSize: insideArc ? 9 : (compact ? 11 : 12),
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
