import 'package:equatable/equatable.dart';

/// Location and calculation inputs consumed by the prayer engine.
class PrayerEngineSettings extends Equatable {
  const PrayerEngineSettings({
    required this.latitude,
    required this.longitude,
    required this.calculationMethod,
    required this.locationName,
  });

  final double latitude;
  final double longitude;
  final String calculationMethod;
  final String locationName;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        calculationMethod,
        locationName,
      ];
}
