import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/core/providers/core_providers.dart';
import 'package:deentrack/features/habits/data/repositories/habit_repository_impl.dart';
import 'package:deentrack/features/habits/domain/entities/habit_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final habitRepositoryProvider = Provider<HabitRepositoryImpl>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return HabitRepositoryImpl(isar);
});

final habitDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final habitRevisionProvider = StateProvider<int>((ref) => 0);

void bumpHabitRevision(Ref ref) {
  ref.read(habitRevisionProvider.notifier).state++;
}

final habitsProvider =
    AsyncNotifierProvider<HabitsNotifier, List<HabitEntity>>(HabitsNotifier.new);

class HabitsNotifier extends AsyncNotifier<List<HabitEntity>> {
  @override
  Future<List<HabitEntity>> build() async {
    ref.watch(habitRevisionProvider);
    final repo = ref.watch(habitRepositoryProvider);
    await repo.seedDefaultsIfNeeded();
    final result = await repo.getActiveHabits();
    return switch (result) {
      Success<List<HabitEntity>>(:final value) => value,
      FailureResult<List<HabitEntity>>(:final failure) => throw failure,
    };
  }

  Future<void> addHabit({
    required String title,
    String? arabicTitle,
    String? description,
    required String category,
    String? emoji,
    String? color,
    String? goal,
  }) async {
    final repo = ref.read(habitRepositoryProvider);
    final result = await repo.addHabit(
      title: title,
      arabicTitle: arabicTitle,
      description: description,
      category: category,
      targetFrequency: 1,
      emoji: emoji,
      color: color,
      goal: goal,
    );

    if (result is FailureResult<HabitEntity>) {
      throw result.failure;
    }
    bumpHabitRevision(ref);
  }
}

final habitCompletionForSelectedDateProvider =
    FutureProvider<Map<int, bool>>((ref) async {
  ref.watch(habitRevisionProvider);
  final repo = ref.watch(habitRepositoryProvider);
  final date = ref.watch(habitDateProvider);
  final result = await repo.getCompletionMapForDate(date);
  return switch (result) {
    Success<Map<int, bool>>(:final value) => value,
    FailureResult<Map<int, bool>>(:final failure) => throw failure,
  };
});

final habitActionControllerProvider =
    AsyncNotifierProvider<HabitActionController, void>(
  HabitActionController.new,
);

class HabitActionController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> toggle({
    required int habitId,
    required bool completed,
  }) async {
    state = const AsyncLoading();
    final repo = ref.read(habitRepositoryProvider);
    final date = ref.read(habitDateProvider);
    final result = await repo.toggleCompletion(
      habitId: habitId,
      date: date,
      completed: completed,
    );

    switch (result) {
      case Success<void>():
        state = const AsyncData(null);
        bumpHabitRevision(ref);
      case FailureResult<void>(:final failure):
        state = AsyncError<void>(failure, StackTrace.current);
    }
  }
}
