import 'dart:math' as math;

import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/services/models/qibla_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final qiblaReadingProvider = StreamProvider<Result<QiblaReading>>((ref) async* {
  final locationResult = await ref.read(locationServiceProvider).getCurrentLocation();
  switch (locationResult) {
    case Success(:final value):
      yield* ref.read(qiblaServiceProvider).watchQibla(
            latitude: value.latitude,
            longitude: value.longitude,
          );
    case FailureResult(:final failure):
      yield FailureResult(failure);
  }
});

class QiblaPage extends ConsumerWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readingAsync = ref.watch(qiblaReadingProvider);

    return Scaffold(
      appBar: AppBar(title: Text('qibla_title'.tr())),
      body: readingAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (result) => switch (result) {
          Success(:final value) => _QiblaCompass(reading: value),
          FailureResult(:final failure) => Center(child: Text(failure.message)),
        },
      ),
    );
  }
}

class _QiblaCompass extends StatelessWidget {
  const _QiblaCompass({required this.reading});

  final QiblaReading reading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -reading.deviceHeadingDegrees * math.pi / 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400, width: 2),
                  ),
                ),
                Transform.rotate(
                  angle: reading.bearingDegrees * math.pi / 180,
                  child: const Icon(
                    Icons.navigation,
                    size: 130,
                    color: Color(0xFF0D5C3A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            reading.isAligned ? 'qibla_aligned'.tr() : 'qibla_align_hint'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'qibla_distance'.tr(args: ['${reading.distanceToKaabaKm.round()}']),
          ),
        ],
      ),
    );
  }
}
