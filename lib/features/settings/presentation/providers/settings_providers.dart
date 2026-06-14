import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/providers/invalidation_providers.dart';
import 'package:deentrack/core/theme/theme_mode_provider.dart';
import 'package:deentrack/features/settings/data/repositories/user_settings_repository_impl.dart';
import 'package:deentrack/features/settings/domain/repositories/user_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return UserSettingsRepositoryImpl(isar);
});

final userSettingsProvider =
    AsyncNotifierProvider<UserSettingsNotifier, UserSettingsCollection>(
  UserSettingsNotifier.new,
);

class UserSettingsNotifier extends AsyncNotifier<UserSettingsCollection> {
  @override
  Future<UserSettingsCollection> build() async {
    final repo = ref.watch(userSettingsRepositoryProvider);
    final result = await repo.getSettings();
    final settings = switch (result) {
      Success<UserSettingsCollection>(:final value) => value,
      FailureResult<UserSettingsCollection>(:final failure) => throw failure,
    };

    _syncTheme(settings);
    return settings;
  }

  Future<void> saveSettings(UserSettingsCollection settings) async {
    final repo = ref.read(userSettingsRepositoryProvider);
    final result = await repo.updateSettings(settings);
    switch (result) {
      case Success<UserSettingsCollection>(:final value):
        state = AsyncData(value);
        _syncTheme(value);
        bumpSettingsRevision(ref);
      case FailureResult<UserSettingsCollection>(:final failure):
        throw failure;
    }
  }

  void _syncTheme(UserSettingsCollection settings) {
    ref.read(themeModeProvider.notifier).state = switch (settings.themeMode) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
    ref.read(textScaleFactorProvider.notifier).state = switch (settings.textSize) {
      'large' => 1.1,
      'extra-large' => 1.22,
      _ => 1.0,
    };
  }
}
