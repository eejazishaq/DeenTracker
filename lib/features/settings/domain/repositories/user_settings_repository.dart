import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/errors/result.dart';

abstract interface class UserSettingsRepository {
  Future<Result<UserSettingsCollection>> getSettings();
  Future<Result<UserSettingsCollection>> updateSettings(
    UserSettingsCollection settings,
  );
}
