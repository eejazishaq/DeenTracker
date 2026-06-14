import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/services/models/prayer_schedule.dart';
import 'package:deentrack/features/prayers/domain/repositories/prayer_schedule_repository.dart';

/// Resolves current prayer, next prayer, and remaining countdown.
class GetPrayerWindowUseCase {
  const GetPrayerWindowUseCase(this._repository);

  final PrayerScheduleRepository _repository;

  Future<Result<PrayerWindow>> call({
    required double latitude,
    required double longitude,
    required String calculationMethod,
    DateTime? at,
  }) {
    return _repository.getPrayerWindow(
      at: at ?? DateTime.now(),
      latitude: latitude,
      longitude: longitude,
      calculationMethod: calculationMethod,
    );
  }
}
