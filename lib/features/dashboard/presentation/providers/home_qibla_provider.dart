import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/core/providers/invalidation_providers.dart';
import 'package:deentrack/core/services/models/qibla_data.dart';
import 'package:deentrack/features/prayers/presentation/providers/prayer_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Live Qibla reading for the home header, using saved prayer location.
final homeQiblaReadingProvider = StreamProvider<Result<QiblaReading>>((ref) {
  ref.watch(settingsRevisionProvider);
  final settings = ref.watch(prayerEngineSettingsProvider).valueOrNull;
  if (settings == null) {
    return const Stream<Result<QiblaReading>>.empty();
  }

  return ref.read(qiblaServiceProvider).watchQibla(
        latitude: settings.latitude,
        longitude: settings.longitude,
      );
});
