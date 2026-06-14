import 'package:deentrack/core/database/collections/habit_collection.dart';
import 'package:deentrack/core/database/collections/habit_record_collection.dart';
import 'package:deentrack/core/errors/failures.dart';
import 'package:deentrack/core/errors/result.dart';
import 'package:deentrack/features/habits/domain/entities/habit_entity.dart';
import 'package:isar/isar.dart';

class HabitRepositoryImpl {
  HabitRepositoryImpl(this._isar);

  final Isar _isar;

  Future<Result<void>> seedDefaultsIfNeeded() async {
    try {
      final count = await _isar.habitCollections.where().count();
      if (count > 0) {
        return const Success(null);
      }

      final now = DateTime.now();
      final defaults = [
        _createDefault(
          title: 'Morning Adhkar',
          arabicTitle: 'أذكار الصباح',
          category: 'remembrance',
          emoji: '🌅',
          color: '#0D5C3A',
          goal: 'After Fajr',
          now: now,
        ),
        _createDefault(
          title: 'Evening Adhkar',
          arabicTitle: 'أذكار المساء',
          category: 'remembrance',
          emoji: '🌙',
          color: '#103E44',
          goal: 'After Asr',
          now: now,
        ),
        _createDefault(
          title: 'Read Quran',
          arabicTitle: 'قراءة القرآن',
          category: 'quran',
          emoji: '📖',
          color: '#D4AF37',
          goal: '1 page daily',
          now: now,
        ),
        _createDefault(
          title: 'Pray Witr',
          arabicTitle: 'صلاة الوتر',
          category: 'night',
          emoji: '🤲',
          color: '#6B7280',
          goal: 'Before sleeping',
          now: now,
        ),
      ];

      await _isar.writeTxn(() async {
        await _isar.habitCollections.putAll(defaults);
      });
      return const Success(null);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  Future<Result<List<HabitEntity>>> getActiveHabits() async {
    try {
      final rows = await _isar.habitCollections
          .filter()
          .isActiveEqualTo(true)
          .sortByCreatedAt()
          .findAll();
      return Success(rows.map(_toEntity).toList());
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  Future<Result<HabitEntity>> addHabit({
    required String title,
    String? arabicTitle,
    String? description,
    required String category,
    required int targetFrequency,
    String? emoji,
    String? color,
    String? goal,
  }) async {
    try {
      final row = HabitCollection()
        ..title = title
        ..arabicTitle = arabicTitle
        ..description = description
        ..category = category
        ..targetFrequency = targetFrequency
        ..isDefault = false
        ..iconName = null
        ..emoji = emoji
        ..color = color
        ..repeatDays = 'M,T,W,T,F,S,S'
        ..repeatFrequency = 'daily'
        ..goal = goal
        ..isActive = true
        ..createdAt = DateTime.now();

      await _isar.writeTxn(() async {
        row.id = await _isar.habitCollections.put(row);
      });
      return Success(_toEntity(row));
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  Future<Result<Map<int, bool>>> getCompletionMapForDate(DateTime date) async {
    try {
      final dateKey = _dateKey(date);
      final records = await _isar.habitRecordCollections
          .filter()
          .dateEqualTo(dateKey)
          .findAll();
      return Success({for (final row in records) row.habitId: row.completed});
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  Future<Result<void>> toggleCompletion({
    required int habitId,
    required DateTime date,
    required bool completed,
  }) async {
    try {
      final dateKey = _dateKey(date);
      final key = '$dateKey::$habitId';
      await _isar.writeTxn(() async {
        final existing = await _isar.habitRecordCollections
            .filter()
            .compoundKeyEqualTo(key)
            .findFirst();
        final row = HabitRecordCollection()
          ..habitId = habitId
          ..date = dateKey
          ..completed = completed
          ..loggedAt = DateTime.now()
          ..compoundKey = key;
        if (existing != null) {
          row.id = existing.id;
        }
        await _isar.habitRecordCollections.put(row);
      });
      return const Success(null);
    } catch (error) {
      return FailureResult(DatabaseFailure(cause: error));
    }
  }

  HabitEntity _toEntity(HabitCollection row) {
    return HabitEntity(
      id: row.id,
      title: row.title,
      description: row.description,
      arabicTitle: row.arabicTitle,
      category: row.category,
      targetFrequency: row.targetFrequency,
      isDefault: row.isDefault,
      iconName: row.iconName,
      emoji: row.emoji,
      color: row.color,
      repeatDays: row.repeatDays,
      repeatFrequency: row.repeatFrequency,
      goal: row.goal,
      isActive: row.isActive,
      createdAt: row.createdAt,
    );
  }

  HabitCollection _createDefault({
    required String title,
    required String arabicTitle,
    required String category,
    required String emoji,
    required String color,
    required String goal,
    required DateTime now,
  }) {
    return HabitCollection()
      ..title = title
      ..description = null
      ..arabicTitle = arabicTitle
      ..category = category
      ..targetFrequency = 1
      ..isDefault = true
      ..iconName = null
      ..emoji = emoji
      ..color = color
      ..repeatDays = 'M,T,W,T,F,S,S'
      ..repeatFrequency = 'daily'
      ..goal = goal
      ..isActive = true
      ..createdAt = now;
  }

  String _dateKey(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }
}
