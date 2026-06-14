import 'package:deentrack/core/constants/app_constants.dart';
import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/interfaces/location_service.dart';
import 'package:deentrack/features/settings/domain/repositories/user_settings_repository.dart';
import 'package:deentrack/shared/utils/location_utils.dart';

/// Fetches device GPS coordinates and persists them for prayer calculations.
class SyncUserLocationUseCase {
  const SyncUserLocationUseCase({
    required LocationService locationService,
    required UserSettingsRepository settingsRepository,
  })  : _locationService = locationService,
        _settingsRepository = settingsRepository;

  final LocationService _locationService;
  final UserSettingsRepository _settingsRepository;

  Future<Result<UserSettingsCollection>> call() async {
    final locationResult = await _locationService.getCurrentLocation();
    if (locationResult case FailureResult(:final failure)) {
      return FailureResult(failure);
    }

    final location = switch (locationResult) {
      Success(:final value) => value,
      FailureResult() => throw StateError('Unreachable'),
    };

    final settingsResult = await _settingsRepository.getSettings();
    if (settingsResult case FailureResult(:final failure)) {
      return FailureResult(failure);
    }

    final settings = switch (settingsResult) {
      Success(:final value) => value,
      FailureResult() => throw StateError('Unreachable'),
    };

    final updated = UserSettingsCollection()
      ..id = settings.id
      ..themeMode = settings.themeMode
      ..language = settings.language
      ..rtlEnabled = settings.rtlEnabled
      ..locationName = LocationUtils.resolveLocationName(
        location.latitude,
        location.longitude,
      )
      ..latitude = location.latitude
      ..longitude = location.longitude
      ..calculationMethod = settings.calculationMethod
      ..azanVolume = settings.azanVolume
      ..vibrationOnReminder = settings.vibrationOnReminder
      ..textSize = settings.textSize
      ..onboardingCompleted = settings.onboardingCompleted
      ..updatedAt = DateTime.now();

    return _settingsRepository.updateSettings(updated);
  }

  /// Whether prayer times should be refreshed from live GPS on app start.
  static bool shouldAutoSync(UserSettingsCollection settings) {
    final latitude = settings.latitude ?? AppConstants.defaultLatitude;
    final longitude = settings.longitude ?? AppConstants.defaultLongitude;
    final isDefault = latitude == AppConstants.defaultLatitude &&
        longitude == AppConstants.defaultLongitude;

    if (isDefault) {
      return true;
    }

    return !LocationUtils.matchesAnyPreset(latitude, longitude);
  }
}
