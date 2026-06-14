class LocationPreset {
  const LocationPreset({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final double latitude;
  final double longitude;
}

abstract final class LocationPresets {
  static const List<LocationPreset> all = [
    LocationPreset(name: 'Makkah, Saudi Arabia', latitude: 21.4225, longitude: 39.8262),
    LocationPreset(name: 'London, United Kingdom', latitude: 51.5074, longitude: -0.1278),
    LocationPreset(name: 'Cairo, Egypt', latitude: 30.0444, longitude: 31.2357),
    LocationPreset(name: 'New York, USA', latitude: 40.7128, longitude: -74.0060),
    LocationPreset(name: 'Kuala Lumpur, Malaysia', latitude: 3.1390, longitude: 101.6869),
    LocationPreset(name: 'Riyadh, Saudi Arabia', latitude: 24.7136, longitude: 46.6753),
    LocationPreset(name: 'Jakarta, Indonesia', latitude: -6.2088, longitude: 106.8456),
  ];
}
