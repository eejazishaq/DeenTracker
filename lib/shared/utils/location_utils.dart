import 'dart:math' as math;

import 'package:deentrack/shared/data/location_presets.dart';

/// Helpers for resolving GPS coordinates to display names and preset matching.
abstract final class LocationUtils {
  static const double _presetMatchThresholdKm = 25;
  static const double _coordinateEpsilon = 0.0001;

  static String resolveLocationName(double latitude, double longitude) {
    final nearest = nearestPreset(latitude, longitude);
    if (nearest == null) {
      return '${latitude.toStringAsFixed(2)}, ${longitude.toStringAsFixed(2)}';
    }
    return nearest.name;
  }

  static LocationPreset? nearestPreset(double latitude, double longitude) {
    LocationPreset? closest;
    var closestDistance = double.infinity;

    for (final preset in LocationPresets.all) {
      final distance = _haversineKm(
        latitude,
        longitude,
        preset.latitude,
        preset.longitude,
      );
      if (distance < closestDistance) {
        closestDistance = distance;
        closest = preset;
      }
    }

    if (closest == null || closestDistance > _presetMatchThresholdKm) {
      return null;
    }
    return closest;
  }

  static bool matchesAnyPreset(double latitude, double longitude) {
    return LocationPresets.all.any(
      (preset) =>
          (preset.latitude - latitude).abs() < _coordinateEpsilon &&
          (preset.longitude - longitude).abs() < _coordinateEpsilon,
    );
  }

  static double _haversineKm(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadiusKm = 6371.0;
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  static double _toRadians(double degrees) => degrees * math.pi / 180;
}
