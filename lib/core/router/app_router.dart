import 'package:deentrack/core/constants/route_paths.dart';
import 'package:deentrack/core/router/router_refresh_notifier.dart';
import 'package:deentrack/features/analytics/presentation/pages/analytics_page.dart';
import 'package:deentrack/features/calendar/presentation/pages/calendar_page.dart';
import 'package:deentrack/features/dashboard/presentation/pages/home_page.dart';
import 'package:deentrack/features/habits/presentation/pages/habits_page.dart';
import 'package:deentrack/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:deentrack/features/prayers/presentation/pages/prayers_page.dart';
import 'package:deentrack/features/qibla/presentation/pages/qibla_page.dart';
import 'package:deentrack/features/settings/presentation/pages/settings_page.dart';
import 'package:deentrack/features/settings/presentation/providers/settings_providers.dart';
import 'package:deentrack/shared/presentation/app_shell.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Riverpod provider exposing the application [GoRouter] instance.
final routerProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ref.watch(routerRefreshNotifierProvider);
  final settings = ref.watch(userSettingsProvider);

  return GoRouter(
    initialLocation: RoutePaths.home,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final completed = settings.valueOrNull?.onboardingCompleted ?? false;
      final isOnboarding = state.matchedLocation == RoutePaths.onboarding;
      if (!completed && !isOnboarding) {
        return RoutePaths.onboarding;
      }
      if (completed && isOnboarding) {
        return RoutePaths.home;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RouteNames.home,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.prayers,
                name: RouteNames.prayers,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PrayersPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.habits,
                name: RouteNames.habits,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HabitsPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                name: RouteNames.settings,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SettingsPage(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.qibla,
        name: RouteNames.qibla,
        builder: (context, state) => const QiblaPage(),
      ),
      GoRoute(
        path: RoutePaths.calendar,
        name: RouteNames.calendar,
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: RoutePaths.analytics,
        name: RouteNames.analytics,
        builder: (context, state) => const AnalyticsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri}'),
      ),
    ),
  );
});
