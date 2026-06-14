import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/location_service.dart';
import 'package:deentrack/core/services/models/location_data.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorLocationService implements LocationService {
  @override
  Future<Result<LocationData>> getCurrentLocation() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        return const FailureResult(
          LocationFailure(message: 'Location services are disabled.'),
        );
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const FailureResult(
          LocationFailure(message: 'Location permission denied.'),
        );
      }

      final position = await Geolocator.getCurrentPosition();
      return Success(
        LocationData(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    } catch (error) {
      return FailureResult(
        LocationFailure(message: 'Failed to get location.', cause: error),
      );
    }
  }

  @override
  Future<Result<bool>> isLocationServiceEnabled() async {
    try {
      return Success(await Geolocator.isLocationServiceEnabled());
    } catch (error) {
      return FailureResult(
        LocationFailure(cause: error),
      );
    }
  }

  @override
  Future<Result<bool>> requestPermission() async {
    try {
      final permission = await Geolocator.requestPermission();
      return Success(
        permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse,
      );
    } catch (error) {
      return FailureResult(LocationFailure(cause: error));
    }
  }

  @override
  Future<Result<void>> openLocationSettings() async {
    try {
      await Geolocator.openLocationSettings();
      return const Success(null);
    } catch (error) {
      return FailureResult(LocationFailure(cause: error));
    }
  }
}
