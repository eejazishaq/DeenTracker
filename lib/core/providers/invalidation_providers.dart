import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bumped when user settings change so prayer engine reloads coordinates.
final settingsRevisionProvider = StateProvider<int>((ref) => 0);

void bumpSettingsRevision(Ref ref) {
  ref.read(settingsRevisionProvider.notifier).state++;
}
