import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Active app locale synchronized with easy_localization.
final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

/// Whether RTL layout should be applied.
final isRtlProvider = Provider<bool>((ref) {
  final locale = ref.watch(localeProvider);
  return locale.languageCode == 'ar';
});

/// Switches language and persists preference in a later phase.
Future<void> setAppLocale({
  required BuildContext context,
  required WidgetRef ref,
  required String languageCode,
}) async {
  final locale = Locale(languageCode);
  await context.setLocale(locale);
  ref.read(localeProvider.notifier).state = locale;
}
