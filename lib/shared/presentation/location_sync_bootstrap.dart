import 'package:deentrack/features/settings/presentation/providers/location_sync_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Triggers a one-time GPS sync when the app boots.
class LocationSyncBootstrap extends ConsumerWidget {
  const LocationSyncBootstrap({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(locationAutoSyncProvider);
    return child;
  }
}
