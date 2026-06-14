import 'package:deentrack/shared/data/location_presets.dart';
import 'package:deentrack/shared/utils/location_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocationUtils', () {
    test('resolves nearest preset within threshold', () {
      final name = LocationUtils.resolveLocationName(24.7136, 46.6753);
      expect(name, 'Riyadh, Saudi Arabia');
    });

    test('matches preset coordinates', () {
      final preset = LocationPresets.all.first;
      expect(
        LocationUtils.matchesAnyPreset(preset.latitude, preset.longitude),
        isTrue,
      );
    });

    test('returns coordinates when no preset is nearby', () {
      final name = LocationUtils.resolveLocationName(0, 0);
      expect(name, '0.00, 0.00');
    });
  });
}
