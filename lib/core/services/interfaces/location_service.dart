import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/location_data.dart';

/// Resolves device GPS coordinates and permission state.
abstract interface class LocationService {
  /// Returns the current device location when permission is granted.
  Future<Result<LocationData>> getCurrentLocation();

  /// Checks whether location services are enabled on the device.
  Future<Result<bool>> isLocationServiceEnabled();

  /// Requests runtime location permission from the user.
  Future<Result<bool>> requestPermission();

  /// Opens the platform location settings screen.
  Future<Result<void>> openLocationSettings();
}
