import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/theme/app_text_styles.dart';
import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Stitch HomeView "Next Prayer" card — `bg-[#1f2e3d]`, amber countdown.
class StitchNextPrayerCard extends StatelessWidget {
  const StitchNextPrayerCard({
    required this.window,
    this.useArabicNames = false,
    super.key,
  });

  final PrayerWindow window;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final countdown = PrayerTimeFormatter.formatCountdown(window.remaining);
    final nextName = useArabicNames
        ? window.next.arabicName
        : window.next.name;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF18181B) : const Color(0xFF1F2E3D),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? const Color(0xFF27272A)
              : const Color(0xFF334155).withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: _LiveIndicator(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'prayer_next_label'.tr(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.grey.shade400,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                countdown,
                style: AppTextStyles.countdown(
                  brightness: Brightness.dark,
                ).copyWith(
                  color: const Color(0xFFFCD34D),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.wb_twilight,
                    size: 14,
                    color: Colors.amber.shade400,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    nextName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFE2E8F0),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'prayer_time_remaining'.tr(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.grey.shade500,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LiveIndicator extends StatefulWidget {
  @override
  State<_LiveIndicator> createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<_LiveIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.8).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOut),
            ),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.6, end: 0).animate(_controller),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF34D399),
                ),
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF34D399),
            ),
            child: SizedBox(width: 8, height: 8),
          ),
        ],
      ),
    );
  }
}
