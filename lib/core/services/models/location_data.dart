import 'package:equatable/equatable.dart';

/// Geographic coordinate with optional human-readable label.
class LocationData extends Equatable {
  const LocationData({
    required this.latitude,
    required this.longitude,
    this.name,
  });

  final double latitude;
  final double longitude;
  final String? name;

  @override
  List<Object?> get props => [latitude, longitude, name];
}
