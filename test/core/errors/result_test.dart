import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test('Success exposes value', () {
      const result = Success<int>(7);
      expect(result.isSuccess, isTrue);
      expect(result.valueOrNull, 7);
      expect(result.failureOrNull, isNull);
    });

    test('Failure exposes failure', () {
      const result = FailureResult<int>(DatabaseFailure());
      expect(result.isFailure, isTrue);
      expect(result.valueOrNull, isNull);
      expect(result.failureOrNull, isA<DatabaseFailure>());
    });

    test('map transforms success value', () {
      const result = Success<int>(2);
      final mapped = result.map((v) => v * 3);
      expect(mapped, isA<Success<int>>());
      expect((mapped as Success<int>).value, 6);
    });

    test('map preserves failure', () {
      const result = FailureResult<int>(UnknownFailure());
      final mapped = result.map((v) => v * 3);
      expect(mapped, isA<FailureResult<int>>());
    });
  });
}
