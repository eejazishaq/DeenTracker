import 'package:adhan/adhan.dart';
import 'package:deentrack/core/services/mappers/calculation_method_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculationMethodMapper', () {
    test('maps Umm Al-Qura label', () {
      expect(
        CalculationMethodMapper.fromLabel('Umm Al-Qura University, Makkah'),
        CalculationMethod.umm_al_qura,
      );
    });

    test('maps MWL label', () {
      expect(
        CalculationMethodMapper.fromLabel('Muslim World League (MWL)'),
        CalculationMethod.muslim_world_league,
      );
    });

    test('maps ISNA label', () {
      expect(
        CalculationMethodMapper.fromLabel(
          'Islamic Society of North America (ISNA)',
        ),
        CalculationMethod.north_america,
      );
    });

    test('maps Egyptian label', () {
      expect(
        CalculationMethodMapper.fromLabel(
          'Egyptian General Authority of Survey',
        ),
        CalculationMethod.egyptian,
      );
    });

    test('maps Karachi label', () {
      expect(
        CalculationMethodMapper.fromLabel(
          'University of Islamic Sciences, Karachi',
        ),
        CalculationMethod.karachi,
      );
    });

    test('falls back to Umm Al-Qura for unknown label', () {
      expect(
        CalculationMethodMapper.fromLabel('Unknown Method'),
        CalculationMethod.umm_al_qura,
      );
    });
  });
}
