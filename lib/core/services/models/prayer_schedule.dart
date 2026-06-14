import 'package:equatable/equatable.dart';

/// Domain model for a single prayer slot within a daily schedule.
class PrayerSlot extends Equatable {
  const PrayerSlot({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.time,
  });

  final String id;
  final String name;
  final String arabicName;
  final DateTime time;

  @override
  List<Object?> get props => [id, name, arabicName, time];
}

/// Full daily prayer schedule returned by [PrayerCalculationService].
class PrayerSchedule extends Equatable {
  const PrayerSchedule({
    required this.date,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.calculationMethod,
    required this.latitude,
    required this.longitude,
  });

  final DateTime date;
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;
  final String calculationMethod;
  final double latitude;
  final double longitude;

  List<PrayerSlot> get slots => [
        PrayerSlot(
          id: 'fajr',
          name: 'Fajr',
          arabicName: 'الفجر',
          time: fajr,
        ),
        PrayerSlot(
          id: 'dhuhr',
          name: 'Dhuhr',
          arabicName: 'الظهر',
          time: dhuhr,
        ),
        PrayerSlot(
          id: 'asr',
          name: 'Asr',
          arabicName: 'العصر',
          time: asr,
        ),
        PrayerSlot(
          id: 'maghrib',
          name: 'Maghrib',
          arabicName: 'المغرب',
          time: maghrib,
        ),
        PrayerSlot(
          id: 'isha',
          name: 'Isha',
          arabicName: 'العشاء',
          time: isha,
        ),
      ];

  @override
  List<Object?> get props => [
        date,
        fajr,
        sunrise,
        dhuhr,
        asr,
        maghrib,
        isha,
        calculationMethod,
        latitude,
        longitude,
      ];
}

/// Current and next prayer snapshot for dashboard countdown UI.
class PrayerWindow extends Equatable {
  const PrayerWindow({
    required this.current,
    required this.next,
    required this.remaining,
    required this.progress,
  });

  final PrayerSlot? current;
  final PrayerSlot next;
  final Duration remaining;
  final double progress;

  @override
  List<Object?> get props => [current, next, remaining, progress];
}
