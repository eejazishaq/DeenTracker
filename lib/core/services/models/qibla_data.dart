import 'package:equatable/equatable.dart';

/// Real-time Qibla compass reading.
class QiblaReading extends Equatable {
  const QiblaReading({
    required this.bearingDegrees,
    required this.deviceHeadingDegrees,
    required this.distanceToKaabaKm,
    required this.isAligned,
  });

  /// Bearing from true north to Kaaba (0–360).
  final double bearingDegrees;

  /// Device compass heading (0–360).
  final double deviceHeadingDegrees;

  final double distanceToKaabaKm;

  /// True when device heading is within alignment threshold of Qibla bearing.
  final bool isAligned;

  @override
  List<Object?> get props => [
        bearingDegrees,
        deviceHeadingDegrees,
        distanceToKaabaKm,
        isAligned,
      ];
}
