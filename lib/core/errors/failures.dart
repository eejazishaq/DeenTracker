import 'package:equatable/equatable.dart';

/// Typed application failures surfaced through the [Result] pattern.
sealed class AppFailure extends Equatable {
  const AppFailure({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  List<Object?> get props => [message, cause];
}

/// Unexpected or uncategorized failure.
final class UnknownFailure extends AppFailure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred.',
    super.cause,
  });
}

/// Isar or persistence layer failure.
final class DatabaseFailure extends AppFailure {
  const DatabaseFailure({
    super.message = 'Unable to access local data.',
    super.cause,
  });
}

/// Geolocation permission or service failure.
final class LocationFailure extends AppFailure {
  const LocationFailure({
    super.message = 'Location is unavailable.',
    super.cause,
  });
}

/// Notification scheduling or permission failure.
final class NotificationFailure extends AppFailure {
  const NotificationFailure({
    super.message = 'Notifications are unavailable.',
    super.cause,
  });
}

/// Compass sensor unavailable or unreliable.
final class CompassFailure extends AppFailure {
  const CompassFailure({
    super.message = 'Compass is unavailable.',
    super.cause,
  });
}

/// Prayer calculation input validation failure.
final class PrayerCalculationFailure extends AppFailure {
  const PrayerCalculationFailure({
    super.message = 'Unable to calculate prayer times.',
    super.cause,
  });
}

/// Network is not required for core flows; reserved for optional features.
final class NetworkFailure extends AppFailure {
  const NetworkFailure({
    super.message = 'Network connection failed.',
    super.cause,
  });
}
