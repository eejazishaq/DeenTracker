import 'package:deentrack/core/constants/app_constants.dart';
import 'package:deentrack/core/database/collections/habit_collection.dart';
import 'package:deentrack/core/database/collections/habit_record_collection.dart';
import 'package:deentrack/core/database/collections/islamic_event_collection.dart';
import 'package:deentrack/core/database/collections/notification_setting_collection.dart';
import 'package:deentrack/core/database/collections/prayer_record_collection.dart';
import 'package:deentrack/core/database/collections/prayer_time_collection.dart';
import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// Opens and initializes the local Isar database.
///
/// Schema changes are handled by Isar's built-in migration when collection
/// fields are added. For breaking changes, bump [schemaVersion] and add an
/// explicit migration step in [open].
abstract final class IsarDatabase {
  /// Increment when a manual migration routine is required.
  static const int schemaVersion = 1;

  static const List<CollectionSchema<dynamic>> schemas = [
    UserSettingsCollectionSchema,
    PrayerTimeCollectionSchema,
    PrayerRecordCollectionSchema,
    HabitCollectionSchema,
    HabitRecordCollectionSchema,
    NotificationSettingCollectionSchema,
    IslamicEventCollectionSchema,
  ];

  static Future<Result<Isar>> open() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        schemas,
        directory: dir.path,
        name: AppConstants.databaseName,
        inspector: kDebugMode,
      );

      await _seedDefaults(isar);
      return Success(isar);
    } catch (error, stackTrace) {
      debugPrint('IsarDatabase.open failed: $error\n$stackTrace');
      return FailureResult(
        DatabaseFailure(
          message: 'Failed to open local database.',
          cause: error,
        ),
      );
    }
  }

  static Future<void> _seedDefaults(Isar isar) async {
    final existing = await isar.userSettingsCollections.get(
      AppConstants.userSettingsId,
    );

    if (existing == null) {
      await isar.writeTxn(() async {
        await isar.userSettingsCollections.put(
          UserSettingsCollection.defaults(),
        );
      });
    }
  }
}
