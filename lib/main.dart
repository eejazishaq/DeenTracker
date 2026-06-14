import 'package:deentrack/app.dart';
import 'package:deentrack/bootstrap.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await bootstrap(() async {
    await EasyLocalization.ensureInitialized();
    final container = ProviderContainer();
    await container.read(localNotificationServiceProvider).initialize();
    container.dispose();

    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(
          child: DeenTrackApp(),
        ),
      ),
    );
  });
}
