import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/providers/invalidation_providers.dart';
import 'package:deentrack/features/settings/domain/usecases/sync_user_location_use_case.dart';
import 'package:deentrack/features/settings/presentation/providers/settings_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final syncUserLocationUseCaseProvider = Provider<SyncUserLocationUseCase>(
  (ref) => SyncUserLocationUseCase(
    locationService: ref.watch(locationServiceProvider),
    settingsRepository: ref.watch(userSettingsRepositoryProvider),
  ),
);

typedef LocationSyncAction = Future<bool> Function({bool force});

final locationSyncActionProvider = Provider<LocationSyncAction>((ref) {
  return ({bool force = false}) => performLocationSync(ref, force: force);
});

Future<bool> performLocationSync(
  Ref ref, {
  bool force = false,
}) async {
  if (!force) {
    final settings = await ref.read(userSettingsProvider.future);
    if (!SyncUserLocationUseCase.shouldAutoSync(settings)) {
      return true;
    }
  }

  final result = await ref.read(syncUserLocationUseCaseProvider)();
  if (result case Success(:final value)) {
    ref.read(userSettingsProvider.notifier).state = AsyncData(value);
    bumpSettingsRevision(ref);
    return true;
  }
  return false;
}

/// Syncs GPS location once when the app starts (if appropriate).
final locationAutoSyncProvider = FutureProvider<void>((ref) async {
  await performLocationSync(ref);
});
