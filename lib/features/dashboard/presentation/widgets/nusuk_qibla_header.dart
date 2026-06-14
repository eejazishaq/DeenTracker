import 'dart:async';
import 'dart:math' as math;

import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/core/services/models/qibla_data.dart';
import 'package:deentrack/features/dashboard/presentation/providers/home_qibla_provider.dart';
import 'package:deentrack/features/dashboard/presentation/widgets/nusuk_service_cards.dart';
import 'package:deentrack/features/prayers/presentation/utils/prayer_time_formatter.dart';
import 'package:deentrack/shared/utils/hijri_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// Nusuk-inspired home header: gradient sky, upward Qibla arc, prayer info.
class NusukQiblaHeader extends ConsumerStatefulWidget {
  const NusukQiblaHeader({
    required this.prayerWindow,
    this.useArabicNames = false,
    this.includeBackground = true,
    this.onPrayerTimes,
    this.onPrayerTracker,
    super.key,
  });

  final AsyncValue<PrayerWindow> prayerWindow;
  final bool useArabicNames;
  final bool includeBackground;
  final VoidCallback? onPrayerTimes;
  final VoidCallback? onPrayerTracker;

  @override
  ConsumerState<NusukQiblaHeader> createState() => _NusukQiblaHeaderState();
}

class _NusukQiblaHeaderState extends ConsumerState<NusukQiblaHeader> {
  bool _wasAligned = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationServiceProvider).requestPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final qiblaAsync = ref.watch(homeQiblaReadingProvider);
    final useArabic = widget.useArabicNames;

    ref.listen(homeQiblaReadingProvider, (previous, next) {
      next.whenData((result) {
        if (result case Success(:final value)) {
          if (value.isAligned && !_wasAligned) {
            HapticFeedback.heavyImpact();
          }
          _wasAligned = value.isAligned;
        }
      });
    });

    final content = SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          4,
          16,
          widget.includeBackground
              ? 20
              : (widget.onPrayerTimes != null ? 72 : 8),
        ),
        child: qiblaAsync.when(
          loading: () => _QiblaArcContent(
            deltaDegrees: -90,
            isAligned: false,
            compassAvailable: false,
            prayerWindow: widget.prayerWindow,
            useArabicNames: useArabic,
            onPrayerTimes: widget.onPrayerTimes,
            onPrayerTracker: widget.onPrayerTracker,
          ),
          error: (_, __) => _QiblaArcContent(
            deltaDegrees: -90,
            isAligned: false,
            compassAvailable: false,
            prayerWindow: widget.prayerWindow,
            useArabicNames: useArabic,
            onPrayerTimes: widget.onPrayerTimes,
            onPrayerTracker: widget.onPrayerTracker,
          ),
          data: (result) => switch (result) {
            Success(:final value) => _QiblaArcContent(
                deltaDegrees: _qiblaDelta(value),
                isAligned: value.isAligned,
                compassAvailable: true,
                prayerWindow: widget.prayerWindow,
                useArabicNames: useArabic,
                onPrayerTimes: widget.onPrayerTimes,
                onPrayerTracker: widget.onPrayerTracker,
              ),
            FailureResult() => _QiblaArcContent(
                deltaDegrees: -90,
                isAligned: false,
                compassAvailable: false,
                prayerWindow: widget.prayerWindow,
                useArabicNames: useArabic,
                onPrayerTimes: widget.onPrayerTimes,
                onPrayerTracker: widget.onPrayerTracker,
              ),
          },
        ),
      ),
    );

    if (!widget.includeBackground) {
      return content;
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1D42),
            Color(0xFF3A3354),
            Color(0xFF654B68),
            Color(0xFF8A675F),
          ],
          stops: [0.0, 0.38, 0.72, 1.0],
        ),
      ),
      child: content,
    );
  }

  double _qiblaDelta(QiblaReading reading) {
    var delta = reading.bearingDegrees - reading.deviceHeadingDegrees;
    while (delta > 180) {
      delta -= 360;
    }
    while (delta < -180) {
      delta += 360;
    }
    return delta;
  }
}

/// Geometry for the Nusuk upward dome arc and in-bowl content.
class _NusukArcLayout {
  _NusukArcLayout(this.width)
      : radius = width * 0.46,
        center = Offset(width / 2, width * 0.46 + 52),
        apex = Offset(width / 2, 52);

  final double width;
  final double radius;
  final Offset center;
  final Offset apex;

  /// Kaaba badge is 36px; text starts below it with a small gap.
  double get textTop => apex.dy + 30;

  /// Full stack height — arc dome through service row inside the bowl.
  double get totalHeight => center.dy + 38;

  /// Angle on the upper semicircle: t=0 left, t=0.5 top, t=1 right.
  static double _upperArcAngle(double t) => math.pi + (math.pi * t);

  static double _angleFromDelta(double deltaDegrees) {
    final clamped = deltaDegrees.clamp(-90.0, 90.0);
    return (3 * math.pi / 2) + (clamped * math.pi / 180);
  }

  Offset pointerOnArc(double deltaDegrees) {
    final angle = _angleFromDelta(deltaDegrees);
    return Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );
  }
}

class _QiblaArcContent extends StatelessWidget {
  const _QiblaArcContent({
    required this.deltaDegrees,
    required this.isAligned,
    required this.compassAvailable,
    required this.prayerWindow,
    required this.useArabicNames,
    this.onPrayerTimes,
    this.onPrayerTracker,
  });

  final double deltaDegrees;
  final bool isAligned;
  final bool compassAvailable;
  final AsyncValue<PrayerWindow> prayerWindow;
  final bool useArabicNames;
  final VoidCallback? onPrayerTimes;
  final VoidCallback? onPrayerTracker;

  @override
  Widget build(BuildContext context) {
    final contentWidth = MediaQuery.sizeOf(context).width - 32;
    final layout = _NusukArcLayout(contentWidth);

    return Center(
      child: SizedBox(
        width: layout.width,
        height: layout.totalHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(layout.width, layout.totalHeight),
              painter: _NusukArcPainter(
                layout: layout,
                deltaDegrees: deltaDegrees,
                isAligned: isAligned,
              ),
            ),
            Positioned(
              top: layout.textTop,
              left: 8,
              right: 8,
              child: prayerWindow.when(
                loading: () => const SizedBox(height: 100),
                error: (_, __) => const SizedBox(height: 100),
                data: (window) => _PrayerInfoOverlay(
                  useArabicNames: useArabicNames,
                  isAligned: isAligned,
                  compassAvailable: compassAvailable,
                  onPrayerTimes: onPrayerTimes,
                  onPrayerTracker: onPrayerTracker,
                ),
              ),
            ),
            Positioned(
              left: layout.apex.dx - 18,
              top: layout.apex.dy - 18,
              child: _KaabaBadge(isAligned: isAligned),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerInfoOverlay extends StatelessWidget {
  const _PrayerInfoOverlay({
    required this.useArabicNames,
    required this.isAligned,
    required this.compassAvailable,
    this.onPrayerTimes,
    this.onPrayerTracker,
  });

  final bool useArabicNames;
  final bool isAligned;
  final bool compassAvailable;
  final VoidCallback? onPrayerTimes;
  final VoidCallback? onPrayerTracker;

  @override
  Widget build(BuildContext context) {
    final hijriDate = HijriUtils.formatDisplay(
      DateTime.now(),
      arabic: useArabicNames,
    );

    final statusText = !compassAvailable
        ? 'home_qibla_compass_unavailable'.tr()
        : isAligned
            ? 'home_qibla_aligned'.tr()
            : 'home_qibla_rotate_hint'.tr();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hijriDate,
          style: GoogleFonts.inter(
            color: const Color(0xBFFFFFFF),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 8),
        const _ArcLiveClock(),
        const SizedBox(height: 8),
        Text(
          statusText,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color:
                isAligned ? const Color(0xFFFFD699) : const Color(0xA3FFFFFF),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
        if (onPrayerTimes != null && onPrayerTracker != null) ...[
          const SizedBox(height: 10),
          NusukServiceCards(
            insideArc: true,
            onPrayerTimes: onPrayerTimes!,
            onPrayerTracker: onPrayerTracker!,
          ),
        ],
      ],
    );
  }
}

/// Live clock shown in the Qibla arc (Nusuk-style large time).
class _ArcLiveClock extends StatefulWidget {
  const _ArcLiveClock();

  @override
  State<_ArcLiveClock> createState() => _ArcLiveClockState();
}

class _ArcLiveClockState extends State<_ArcLiveClock> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      PrayerTimeFormatter.formatNusukTime(DateTime.now()),
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.15,
        letterSpacing: -0.2,
      ),
    );
  }
}

class _KaabaBadge extends StatelessWidget {
  const _KaabaBadge({required this.isAligned});

  final bool isAligned;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: isAligned
                ? const Color(0xFFFFD699).withValues(alpha: 0.45)
                : Colors.black.withValues(alpha: 0.12),
            blurRadius: isAligned ? 10 : 5,
          ),
        ],
      ),
      child: const CustomPaint(
        painter: _KaabaIconPainter(),
      ),
    );
  }
}

class _NusukArcPainter extends CustomPainter {
  _NusukArcPainter({
    required this.layout,
    required this.deltaDegrees,
    required this.isAligned,
  });

  final _NusukArcLayout layout;
  final double deltaDegrees;
  final bool isAligned;

  @override
  void paint(Canvas canvas, Size size) {
    final arcPaint = Paint()
      ..color = const Color(0xD9FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // Upper semicircle: π (left) → 3π/2 (top) → 2π (right). Do NOT sweep
    // through π/2 — that draws the bottom ∪ bowl instead of the top ∩ dome.
    final path = Path();
    const steps = 80;
    for (var i = 0; i <= steps; i++) {
      final t = i / steps;
      final angle = _NusukArcLayout._upperArcAngle(t);
      final point = Offset(
        layout.center.dx + layout.radius * math.cos(angle),
        layout.center.dy + layout.radius * math.sin(angle),
      );
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    canvas.drawPath(path, arcPaint);

    final pointerPos = layout.pointerOnArc(deltaDegrees);
    final pointerColor =
        isAligned ? const Color(0xFFFF9F5A) : const Color(0xFFE8754E);

    // Skip drawing the pointer when it would sit over the center content bowl.
    final contentTop = layout.textTop;
    final contentBottom = layout.center.dy + 8;
    final inContentZone = pointerPos.dy >= contentTop - 12 &&
        pointerPos.dy <= contentBottom &&
        pointerPos.dx >= layout.width * 0.22 &&
        pointerPos.dx <= layout.width * 0.78;
    if (!inContentZone) {
      canvas.drawCircle(
        pointerPos,
        17,
        Paint()
          ..color = pointerColor.withValues(alpha: 0.28)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7),
      );

      canvas.drawCircle(
        pointerPos,
        14,
        Paint()..color = pointerColor,
      );

      final chevron = Path()
        ..moveTo(pointerPos.dx - 5.5, pointerPos.dy + 2)
        ..lineTo(pointerPos.dx, pointerPos.dy - 5)
        ..lineTo(pointerPos.dx + 5.5, pointerPos.dy + 2);

      canvas.drawPath(
        chevron,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _NusukArcPainter oldDelegate) {
    return oldDelegate.deltaDegrees != deltaDegrees ||
        oldDelegate.isAligned != isAligned;
  }
}

class _KaabaIconPainter extends CustomPainter {
  const _KaabaIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w / 2;
    final cy = h / 2 + 1;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, cy),
          width: w * 0.5,
          height: h * 0.46,
        ),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFF1A1A1A),
    );

    canvas.drawLine(
      Offset(cx - w * 0.25, cy - 3),
      Offset(cx + w * 0.25, cy - 3),
      Paint()
        ..color = const Color(0xFFD4AF37)
        ..strokeWidth = 1.6,
    );

    canvas.drawLine(
      Offset(cx, cy - h * 0.16),
      Offset(cx, cy + h * 0.16),
      Paint()
        ..color = const Color(0xFFD4AF37)
        ..strokeWidth = 1.2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
