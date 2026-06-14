import 'dart:math' as math;

import 'package:deentrack/core/constants/app_constants.dart';

/// Spherical trigonometry helpers from the Stitch design spec.
abstract final class QiblaMath {
  static double bearingToKaaba({
    required double latitude,
    required double longitude,
  }) {
    final phi1 = _toRadians(latitude);
    final phi2 = _toRadians(AppConstants.kaabaLatitude);
    final lam1 = _toRadians(longitude);
    final lam2 = _toRadians(AppConstants.kaabaLongitude);
    final dLam = lam2 - lam1;

    final y = math.sin(dLam) * math.cos(phi2);
    final x = math.cos(phi1) * math.sin(phi2) -
        math.sin(phi1) * math.cos(phi2) * math.cos(dLam);
    final bearing = math.atan2(y, x);
    return (_toDegrees(bearing) + 360) % 360;
  }

  static double distanceToKaabaKm({
    required double latitude,
    required double longitude,
  }) {
    const earthRadiusKm = 6371.0;
    final dLat = _toRadians(AppConstants.kaabaLatitude - latitude);
    final dLon = _toRadians(AppConstants.kaabaLongitude - longitude);
    final lat1 = _toRadians(latitude);
    final lat2 = _toRadians(AppConstants.kaabaLatitude);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return (earthRadiusKm * c).roundToDouble();
  }

  static bool isAligned({
    required double deviceHeading,
    required double qiblaBearing,
    double thresholdDegrees = 5,
  }) {
    final diff = (deviceHeading - qiblaBearing).abs() % 360;
    return diff <= thresholdDegrees || diff >= 360 - thresholdDegrees;
  }

  static double _toRadians(double degrees) => degrees * math.pi / 180;

  static double _toDegrees(double radians) => radians * 180 / math.pi;
}
