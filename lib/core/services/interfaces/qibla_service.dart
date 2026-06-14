import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/qibla_data.dart';

/// Combines geolocation, compass heading, and Kaaba bearing calculation.
abstract interface class QiblaService {
  /// Starts listening to compass updates. Emits [QiblaReading] snapshots.
  Stream<Result<QiblaReading>> watchQibla({
    required double latitude,
    required double longitude,
  });

  /// Computes a one-shot Qibla reading without subscribing to the compass.
  Future<Result<QiblaReading>> getQiblaReading({
    required double latitude,
    required double longitude,
    double? deviceHeadingDegrees,
  });

  /// Stops compass listeners to conserve battery.
  Future<void> dispose();
}
