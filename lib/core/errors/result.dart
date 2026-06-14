import 'package:deentrack/core/errors/failures.dart';
import 'package:equatable/equatable.dart';

/// Discriminated result type used across use cases and repositories.
sealed class Result<T> extends Equatable {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get valueOrNull => switch (this) {
        Success<T>(:final value) => value,
        FailureResult<T>() => null,
      };

  AppFailure? get failureOrNull => switch (this) {
        Success<T>() => null,
        FailureResult<T>(:final failure) => failure,
      };

  Result<R> map<R>(R Function(T value) transform) => switch (this) {
        Success<T>(:final value) => Success(transform(value)),
        FailureResult<T>(:final failure) => FailureResult(failure),
      };

  Future<Result<R>> mapAsync<R>(Future<R> Function(T value) transform) async =>
      switch (this) {
        Success<T>(:final value) => Success(await transform(value)),
        FailureResult<T>(:final failure) => FailureResult(failure),
      };

  Result<R> flatMap<R>(Result<R> Function(T value) transform) => switch (this) {
        Success<T>(:final value) => transform(value),
        FailureResult<T>(:final failure) => FailureResult(failure),
      };

  @override
  List<Object?> get props => [];
}

/// Successful operation with a value.
final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  List<Object?> get props => [value];
}

/// Failed operation with a typed [AppFailure].
final class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  final AppFailure failure;

  @override
  List<Object?> get props => [failure];
}
