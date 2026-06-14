import 'package:adhan/adhan.dart';
import 'package:deentrack/core/constants/app_constants.dart';

/// Maps persisted calculation method labels to [CalculationMethod] presets.
abstract final class CalculationMethodMapper {
  static const Map<String, CalculationMethod> _methodByLabel = {
    'Umm Al-Qura University, Makkah': CalculationMethod.umm_al_qura,
    'Muslim World League (MWL)': CalculationMethod.muslim_world_league,
    'Islamic Society of North America (ISNA)': CalculationMethod.north_america,
    'Egyptian General Authority of Survey': CalculationMethod.egyptian,
    'University of Islamic Sciences, Karachi': CalculationMethod.karachi,
  };

  static CalculationMethod fromLabel(String label) {
    return _methodByLabel[label] ?? CalculationMethod.umm_al_qura;
  }

  static CalculationParameters parametersFor(String label) {
    return fromLabel(label).getParameters();
  }

  static String defaultLabel = AppConstants.defaultCalculationMethod;
}
