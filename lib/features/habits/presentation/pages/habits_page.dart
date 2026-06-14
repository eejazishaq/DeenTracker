import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/features/habits/presentation/providers/habit_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitsPage extends ConsumerStatefulWidget {
  const HabitsPage({super.key});

  @override
  ConsumerState<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends ConsumerState<HabitsPage> {
  final _titleController = TextEditingController();
  final _arabicController = TextEditingController();
  final _goalController = TextEditingController();
  String _category = 'custom';
  String _emoji = '✨';

  @override
  void dispose() {
    _titleController.dispose();
    _arabicController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habitsAsync = ref.watch(habitsProvider);
    final completionAsync = ref.watch(habitCompletionForSelectedDateProvider);

    return Scaffold(
      appBar: AppBar(title: Text('habits_title'.tr())),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddHabitSheet,
        icon: const Icon(Icons.add),
        label: Text('habits_add_deed'.tr()),
      ),
      body: habitsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (habits) {
          if (habits.isEmpty) {
            return Center(child: Text('habits_empty'.tr()));
          }

          return completionAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text(error.toString())),
            data: (completionMap) => ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                final completed = completionMap[habit.id] ?? false;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.zinc900
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.zinc850
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: CheckboxListTile(
                    value: completed,
                    onChanged: (value) {
                      ref.read(habitActionControllerProvider.notifier).toggle(
                            habitId: habit.id,
                            completed: value ?? false,
                          );
                    },
                    title: Text(
                      '${habit.emoji ?? '✨'} ${habit.title}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      habit.goal ?? 'habits_no_goal'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    secondary: _CategoryBadge(category: habit.category),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showAddHabitSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              8,
              20,
              MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'habits_add_deed'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'habits_field_title'.tr(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _arabicController,
                    decoration: InputDecoration(
                      labelText: 'habits_field_arabic_title'.tr(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _goalController,
                    decoration: InputDecoration(
                      labelText: 'habits_field_goal'.tr(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _category,
                    decoration: InputDecoration(
                      labelText: 'habits_field_category'.tr(),
                    ),
                    items: const [
                      'custom',
                      'quran',
                      'remembrance',
                      'night',
                      'charity',
                    ]
                        .map(
                          (c) => DropdownMenuItem(
                            value: c,
                            child: Text('habits_category_$c'.tr()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setModalState(() => _category = value);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('habits_choose_preset'.tr()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['✨', '📖', '🤲', '🕌', '💛', '🌙']
                        .map(
                          (emoji) => ChoiceChip(
                            label: Text(emoji),
                            selected: _emoji == emoji,
                            onSelected: (_) {
                              setModalState(() => _emoji = emoji);
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () async {
                      final title = _titleController.text.trim();
                      if (title.isEmpty) {
                        return;
                      }
                      await ref.read(habitsProvider.notifier).addHabit(
                            title: title,
                            arabicTitle: _arabicController.text.trim().isEmpty
                                ? null
                                : _arabicController.text.trim(),
                            category: _category,
                            goal: _goalController.text.trim().isEmpty
                                ? null
                                : _goalController.text.trim(),
                            emoji: _emoji,
                            color: '#0D5C3A',
                          );
                      if (!mounted) {
                        return;
                      }
                      _titleController.clear();
                      _arabicController.clear();
                      _goalController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('habits_save'.tr()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0D5C3A).withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        'habits_category_$category'.tr(),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
