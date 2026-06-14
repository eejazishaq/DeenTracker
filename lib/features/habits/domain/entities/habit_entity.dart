import 'package:equatable/equatable.dart';

class HabitEntity extends Equatable {
  const HabitEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.arabicTitle,
    required this.category,
    required this.targetFrequency,
    required this.isDefault,
    required this.iconName,
    required this.emoji,
    required this.color,
    required this.repeatDays,
    required this.repeatFrequency,
    required this.goal,
    required this.isActive,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String? description;
  final String? arabicTitle;
  final String category;
  final int targetFrequency;
  final bool isDefault;
  final String? iconName;
  final String? emoji;
  final String? color;
  final String? repeatDays;
  final String? repeatFrequency;
  final String? goal;
  final bool isActive;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        arabicTitle,
        category,
        targetFrequency,
        isDefault,
        iconName,
        emoji,
        color,
        repeatDays,
        repeatFrequency,
        goal,
        isActive,
        createdAt,
      ];
}
