import 'dart:async';

import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Visual variants for the home next-prayer overlay card.
enum NextPrayerCardVariant {
  /// White card, label + prayer row, countdown pill (default).
  classic,

  /// Countdown-forward layout with accent left stripe.
  minimal,

  /// Soft gradient header band with compact footer row.
  gradient,
}

/// White overlay card overlapping the gradient hero (Nusuk-style).
class NusukNextPrayerOverlayCard extends StatefulWidget {
  const NusukNextPrayerOverlayCard({
    required this.window,
    this.useArabicNames = false,
    this.variant = NextPrayerCardVariant.classic,
    super.key,
  });

  final PrayerWindow window;
  final bool useArabicNames;
  final NextPrayerCardVariant variant;

  @override
  State<NusukNextPrayerOverlayCard> createState() =>
      _NusukNextPrayerOverlayCardState();
}

class _NusukNextPrayerOverlayCardState
    extends State<NusukNextPrayerOverlayCard> {
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nextName = widget.useArabicNames
        ? widget.window.next.arabicName
        : widget.window.next.name;
    final nextTime =
        PrayerTimeFormatter.formatNusukTime(widget.window.next.time);
    final countdown =
        PrayerTimeFormatter.formatCountdown(widget.window.remaining);

    return switch (widget.variant) {
      NextPrayerCardVariant.classic => _ClassicDesign(
          nextName: nextName,
          nextTime: nextTime,
          countdown: countdown,
        ),
      NextPrayerCardVariant.minimal => _MinimalDesign(
          nextName: nextName,
          nextTime: nextTime,
          countdown: countdown,
        ),
      NextPrayerCardVariant.gradient => _GradientDesign(
          nextName: nextName,
          nextTime: nextTime,
          countdown: countdown,
        ),
    };
  }
}

class _ClassicDesign extends StatelessWidget {
  const _ClassicDesign({
    required this.nextName,
    required this.nextTime,
    required this.countdown,
  });

  final String nextName;
  final String nextTime;
  final String countdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'prayer_next_label'.tr(),
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$nextName $nextTime',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0F172A),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF34D399),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _CountdownPill(countdown: countdown),
        ],
      ),
    );
  }
}

class _MinimalDesign extends StatelessWidget {
  const _MinimalDesign({
    required this.nextName,
    required this.nextTime,
    required this.countdown,
  });

  final String nextName;
  final String nextTime;
  final String countdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: AppColors.deepEmerald,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$nextName · $nextTime',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      countdown,
                      style: GoogleFonts.jetBrainsMono(
                        color: const Color(0xFF0F172A),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'prayer_time_remaining'.tr(),
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientDesign extends StatelessWidget {
  const _GradientDesign({
    required this.nextName,
    required this.nextTime,
    required this.countdown,
  });

  final String nextName;
  final String nextTime;
  final String countdown;

  static const _footerTint = Color(0xFFF4F8F6);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: AppColors.deepEmerald.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1D42),
                  Color(0xFF065F46),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.wb_twilight_rounded,
                    color: Color(0xFFFCD34D),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'prayer_next_label'.tr(),
                        style: GoogleFonts.inter(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$nextName $nextTime',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 14),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _footerTint,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'prayer_time_remaining'.tr(),
                        style: GoogleFonts.inter(
                          color: const Color(0xFF64748B),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        countdown,
                        style: GoogleFonts.jetBrainsMono(
                          color: AppColors.deepEmerald,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.deepEmerald.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.schedule_rounded,
                    color: AppColors.deepEmerald.withValues(alpha: 0.9),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CountdownPill extends StatelessWidget {
  const _CountdownPill({required this.countdown});

  final String countdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'prayer_time_remaining'.tr(),
                style: GoogleFonts.inter(
                  color: const Color(0xFF64748B),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                countdown,
                style: GoogleFonts.jetBrainsMono(
                  color: const Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          Icon(
            Icons.wb_twilight_rounded,
            color: Colors.amber.shade600,
            size: 28,
          ),
        ],
      ),
    );
  }
}

/// Side-by-side preview of all next-prayer card variants for design review.
class NextPrayerCardDesignPreview extends StatelessWidget {
  const NextPrayerCardDesignPreview({
    required this.window,
    this.useArabicNames = false,
    super.key,
  });

  final PrayerWindow window;
  final bool useArabicNames;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'home_next_prayer_designs_title'.tr(),
          style: GoogleFonts.inter(
            color: const Color(0xFF64748B),
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 14),
        _DesignSample(
          label: 'home_next_prayer_design_a'.tr(),
          child: NusukNextPrayerOverlayCard(
            window: window,
            useArabicNames: useArabicNames,
            variant: NextPrayerCardVariant.classic,
          ),
        ),
        const SizedBox(height: 14),
        _DesignSample(
          label: 'home_next_prayer_design_b'.tr(),
          child: NusukNextPrayerOverlayCard(
            window: window,
            useArabicNames: useArabicNames,
            variant: NextPrayerCardVariant.minimal,
          ),
        ),
        const SizedBox(height: 14),
        _DesignSample(
          label: 'home_next_prayer_design_c'.tr(),
          child: NusukNextPrayerOverlayCard(
            window: window,
            useArabicNames: useArabicNames,
            variant: NextPrayerCardVariant.gradient,
          ),
        ),
      ],
    );
  }
}

class _DesignSample extends StatelessWidget {
  const _DesignSample({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: const Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
