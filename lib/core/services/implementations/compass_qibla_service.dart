import 'dart:async';

import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/qibla_service.dart';
import 'package:deentrack/core/services/models/qibla_data.dart';
import 'package:deentrack/shared/utils/qibla_math.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class CompassQiblaService implements QiblaService {
  StreamSubscription<dynamic>? _subscription;

  @override
  Stream<Result<QiblaReading>> watchQibla({
    required double latitude,
    required double longitude,
  }) {
    return Stream.multi((controller) async {
      final bearing = QiblaMath.bearingToKaaba(
        latitude: latitude,
        longitude: longitude,
      );
      final distance = QiblaMath.distanceToKaabaKm(
        latitude: latitude,
        longitude: longitude,
      );

      QiblaReading readingFor(double heading) => QiblaReading(
            bearingDegrees: bearing,
            deviceHeadingDegrees: heading,
            distanceToKaabaKm: distance,
            isAligned: QiblaMath.isAligned(
              deviceHeading: heading,
              qiblaBearing: bearing,
            ),
          );

      void emitHeading(double heading) {
        if (controller.isClosed) {
          return;
        }
        controller.add(Success(readingFor(_normalizeHeading(heading))));
      }

      final prepared = await _prepareCompass();
      if (!prepared) {
        if (!controller.isClosed) {
          controller.add(
            const FailureResult(
              CompassFailure(message: 'Compass sensor unavailable.'),
            ),
          );
        }
        await controller.close();
        return;
      }

      final events = FlutterCompass.events;
      if (events == null) {
        if (!controller.isClosed) {
          controller.add(
            const FailureResult(
              CompassFailure(message: 'Compass sensor unavailable.'),
            ),
          );
        }
        await controller.close();
        return;
      }

      var receivedLiveHeading = false;
      Timer? debugSimTimer;
      var debugHeading = 0.0;

      emitHeading(0);

      if (kDebugMode) {
        Timer(const Duration(milliseconds: 1500), () {
          if (receivedLiveHeading || controller.isClosed) {
            return;
          }
          debugSimTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
            if (receivedLiveHeading || controller.isClosed) {
              return;
            }
            debugHeading = (debugHeading + 2) % 360;
            emitHeading(debugHeading);
          });
        });
      }

      controller.onCancel = () {
        debugSimTimer?.cancel();
      };

      await for (final event in events) {
        final heading = _resolveHeading(event);
        if (heading == null) {
          continue;
        }

        receivedLiveHeading = true;
        debugSimTimer?.cancel();
        emitHeading(heading);
      }

      debugSimTimer?.cancel();
      await controller.close();
    });
  }

  @override
  Future<Result<QiblaReading>> getQiblaReading({
    required double latitude,
    required double longitude,
    double? deviceHeadingDegrees,
  }) async {
    final bearing = QiblaMath.bearingToKaaba(
      latitude: latitude,
      longitude: longitude,
    );
    final distance = QiblaMath.distanceToKaabaKm(
      latitude: latitude,
      longitude: longitude,
    );
    var heading = deviceHeadingDegrees;
    if (heading == null) {
      final prepared = await _prepareCompass();
      if (!prepared || FlutterCompass.events == null) {
        return const FailureResult(
          CompassFailure(message: 'Compass sensor unavailable.'),
        );
      }
      final event = await FlutterCompass.events!.first;
      heading = _resolveHeading(event) ?? 0;
    }

    return Success(
      QiblaReading(
        bearingDegrees: bearing,
        deviceHeadingDegrees: _normalizeHeading(heading),
        distanceToKaabaKm: distance,
        isAligned: QiblaMath.isAligned(
          deviceHeading: heading,
          qiblaBearing: bearing,
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  /// iOS only delivers compass headings after location permission + a fix.
  Future<bool> _prepareCompass() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        return FlutterCompass.events != null;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return FlutterCompass.events != null;
      }

      // Prime CoreLocation so trueHeading becomes available on iOS.
      await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 5),
        ),
      );
    } catch (_) {
      // Compass may still work with magnetic heading on some devices.
    }

    return FlutterCompass.events != null;
  }

  double? _resolveHeading(CompassEvent event) {
    final heading = event.heading ?? event.headingForCameraMode;
    if (heading == null || heading.isNaN || heading.isInfinite) {
      return null;
    }
    return heading;
  }

  double _normalizeHeading(double heading) {
    var normalized = heading % 360;
    if (normalized < 0) {
      normalized += 360;
    }
    return normalized;
  }
}
