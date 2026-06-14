import 'package:equatable/equatable.dart';

/// Hijri calendar date representation.
class HijriDate extends Equatable {
  const HijriDate({
    required this.day,
    required this.month,
    required this.monthArabic,
    required this.year,
  });

  final int day;
  final String month;
  final String monthArabic;
  final int year;

  @override
  List<Object?> get props => [day, month, monthArabic, year];

  @override
  String toString() => '$day $month $year';
}
