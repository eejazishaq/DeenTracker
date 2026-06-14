import 'package:deentrack/core/constants/app_constants.dart';
import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/features/settings/domain/repositories/user_settings_repository.dart';
import 'package:isar/isar.dart';

class UserSettingsRepositoryImpl implements UserSettingsRepository {
  UserSettingsRepositoryImpl(this._isar);

  final Isar _isar;

  @override
  Future<Result<UserSettingsCollection>> getSettings() async {
    try {
      final settings = await _isar.userSettingsCollections.get(
        AppConstants.userSettingsId,
      );
      return Success(settings ?? UserSettingsCollection.defaults());
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  @override
  Future<Result<UserSettingsCollection>> updateSettings(
    UserSettingsCollection settings,
  ) async {
    try {
      settings.id = AppConstants.userSettingsId;
      settings.updatedAt = DateTime.now();
      await _isar.writeTxn(() async {
        await _isar.userSettingsCollections.put(settings);
      });
      return Success(settings);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }
}
