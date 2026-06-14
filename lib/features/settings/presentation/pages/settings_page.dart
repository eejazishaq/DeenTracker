import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/core/theme/app_colors.dart';
import 'package:deentrack/features/settings/presentation/providers/location_sync_provider.dart';
import 'package:deentrack/features/settings/presentation/providers/settings_providers.dart';
import 'package:deentrack/shared/data/location_presets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  Future<void> _update(UserSettingsCollection settings) {
    final next = UserSettingsCollection()
      ..id = settings.id
      ..themeMode = settings.themeMode
      ..language = settings.language
      ..rtlEnabled = settings.rtlEnabled
      ..locationName = settings.locationName
      ..latitude = settings.latitude
      ..longitude = settings.longitude
      ..calculationMethod = settings.calculationMethod
      ..azanVolume = settings.azanVolume
      ..vibrationOnReminder = settings.vibrationOnReminder
      ..textSize = settings.textSize
      ..onboardingCompleted = settings.onboardingCompleted
      ..updatedAt = DateTime.now();
    return ref.read(userSettingsProvider.notifier).saveSettings(next);
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(userSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings_title'.tr()),
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (settings) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
            children: [
              _SectionCard(
                title: 'settings_appearance'.tr(),
                children: [
                  _SegmentTile(
                    label: 'settings_theme'.tr(),
                    value: settings.themeMode,
                    options: const ['system', 'light', 'dark'],
                    labels: [
                      'settings_theme_system'.tr(),
                      'settings_theme_light'.tr(),
                      'settings_theme_dark'.tr(),
                    ],
                    onChanged: (value) {
                      _update(settings..themeMode = value);
                    },
                  ),
                  _SegmentTile(
                    label: 'settings_text_size'.tr(),
                    value: settings.textSize,
                    options: const ['normal', 'large', 'extra-large'],
                    labels: [
                      'settings_text_size_normal'.tr(),
                      'settings_text_size_large'.tr(),
                      'settings_text_size_extra_large'.tr(),
                    ],
                    onChanged: (value) {
                      _update(settings..textSize = value);
                    },
                  ),
                ],
              ),
              _SectionCard(
                title: 'settings_language'.tr(),
                children: [
                  _SegmentTile(
                    label: 'settings_language'.tr(),
                    value: settings.language,
                    options: const ['en', 'ar'],
                    labels: ['English', 'العربية'],
                    onChanged: (value) async {
                      await context.setLocale(Locale(value));
                      await _update(settings..language = value);
                    },
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text('settings_rtl'.tr()),
                    subtitle: Text('settings_rtl_hint'.tr()),
                    value: settings.rtlEnabled,
                    onChanged: (value) {
                      _update(settings..rtlEnabled = value);
                    },
                  ),
                ],
              ),
              _SectionCard(
                title: 'settings_location'.tr(),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('settings_current_location'.tr()),
                    subtitle: Text(
                      settings.locationName ?? 'settings_unknown_location'.tr(),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        final synced = await ref
                            .read(locationSyncActionProvider)(force: true);
                        if (!mounted) {
                          return;
                        }
                        if (!synced) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('error_location'.tr())),
                          );
                        }
                      },
                      icon: const Icon(Icons.my_location),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: LocationPresets.all
                        .map(
                          (preset) => ActionChip(
                            label: Text(preset.name),
                            onPressed: () {
                              _update(
                                settings
                                  ..locationName = preset.name
                                  ..latitude = preset.latitude
                                  ..longitude = preset.longitude,
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: settings.calculationMethod,
                    decoration: InputDecoration(
                      labelText: 'settings_calculation_method'.tr(),
                    ),
                    items: const [
                      'Umm Al-Qura University, Makkah',
                      'Muslim World League (MWL)',
                      'Islamic Society of North America (ISNA)',
                      'Egyptian General Authority of Survey',
                      'University of Islamic Sciences, Karachi',
                    ].map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      _update(settings..calculationMethod = value);
                    },
                  ),
                ],
              ),
              _SectionCard(
                title: 'settings_notifications'.tr(),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('settings_azan_volume'.tr()),
                    subtitle: Slider(
                      value: settings.azanVolume.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: settings.azanVolume.toString(),
                      onChanged: (value) {
                        _update(settings..azanVolume = value.round());
                      },
                    ),
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text('settings_vibration'.tr()),
                    value: settings.vibrationOnReminder,
                    onChanged: (value) {
                      _update(settings..vibrationOnReminder = value);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.zinc900
            : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.zinc850
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class _SegmentTile extends StatelessWidget {
  const _SegmentTile({
    required this.label,
    required this.value,
    required this.options,
    required this.labels,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> options;
  final List<String> labels;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: List.generate(
              options.length,
              (i) => ButtonSegment<String>(
                value: options[i],
                label: Text(labels[i]),
              ),
            ),
            selected: {value},
            onSelectionChanged: (selected) => onChanged(selected.first),
          ),
        ],
      ),
    );
  }
}
