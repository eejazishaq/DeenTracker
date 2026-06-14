import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/dashboard/presentation/widgets/nusuk_next_prayer_overlay_card.dart';
import 'package:deentrack/features/dashboard/presentation/widgets/nusuk_qibla_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Scrollable Nusuk hero: gradient arc block + overlapping next-prayer card.
class NusukHomeHeroSection extends ConsumerWidget {
  const NusukHomeHeroSection({
    required this.prayerWindow,
    required this.useArabicNames,
    required this.onPrayerTimes,
    required this.onPrayerTracker,
    this.cardVariant = NextPrayerCardVariant.gradient,
    super.key,
  });

  final AsyncValue<PrayerWindow> prayerWindow;
  final bool useArabicNames;
  final VoidCallback onPrayerTimes;
  final VoidCallback onPrayerTracker;
  final NextPrayerCardVariant cardVariant;

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A1D42),
      Color(0xFF3A3354),
      Color(0xFF654B68),
      Color(0xFF8A675F),
    ],
    stops: [0.0, 0.38, 0.72, 1.0],
  );

  static const _bottomRadius = 36.0;
  static const _overlayBottom = -140.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(_bottomRadius),
                bottomRight: Radius.circular(_bottomRadius),
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(gradient: _gradient),
                child: NusukQiblaHeader(
                  prayerWindow: prayerWindow,
                  useArabicNames: useArabicNames,
                  includeBackground: false,
                  onPrayerTimes: onPrayerTimes,
                  onPrayerTracker: onPrayerTracker,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: _overlayBottom,
              child: prayerWindow.when(
                loading: () => const SizedBox(
                  height: 140,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
                error: (error, _) => const SizedBox.shrink(),
                data: (window) => NusukNextPrayerOverlayCard(
                  window: window,
                  useArabicNames: useArabicNames,
                  variant: cardVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
