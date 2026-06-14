import 'package:deentrack/core/constants/app_constants.dart';
import 'package:deentrack/core/router/app_router.dart';
import 'package:deentrack/core/theme/app_theme.dart';
import 'package:deentrack/core/theme/theme_mode_provider.dart';
import 'package:deentrack/shared/presentation/location_sync_bootstrap.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root widget configuring theme, localization, and navigation.
class DeenTrackApp extends ConsumerWidget {
  const DeenTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final textScaleFactor = ref.watch(textScaleFactorProvider);
    final isRtl =
        context.locale.languageCode == AppConstants.arabicLanguageCode;

    return LocationSyncBootstrap(
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(textScaleFactor: textScaleFactor),
        darkTheme: AppTheme.dark(textScaleFactor: textScaleFactor),
        themeMode: themeMode,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        routerConfig: router,
        builder: (context, child) {
          return Directionality(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
