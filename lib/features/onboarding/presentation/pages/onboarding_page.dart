import 'package:deentrack/core/constants/route_paths.dart';
import 'package:deentrack/core/database/collections/user_settings_collection.dart';
import 'package:deentrack/features/settings/presentation/providers/location_sync_provider.dart';
import 'package:deentrack/features/settings/presentation/providers/settings_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(userSettingsProvider);

    return Scaffold(
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (settings) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) => setState(() => _page = value),
                    children: [
                      _Slide(
                        icon: Icons.schedule,
                        title: 'onboarding_slide1_title'.tr(),
                        subtitle: 'onboarding_slide1_subtitle'.tr(),
                      ),
                      _Slide(
                        icon: Icons.explore,
                        title: 'onboarding_slide2_title'.tr(),
                        subtitle: 'onboarding_slide2_subtitle'.tr(),
                      ),
                      _Slide(
                        icon: Icons.local_fire_department,
                        title: 'onboarding_slide3_title'.tr(),
                        subtitle: 'onboarding_slide3_subtitle'.tr(),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _page == index ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _page == index
                            ? const Color(0xFF0D5C3A)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () async {
                    if (_page < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 260),
                        curve: Curves.easeOut,
                      );
                      return;
                    }
                    await _completeOnboarding(settings);
                    if (!mounted) {
                      return;
                    }
                    context.go(RoutePaths.home);
                  },
                  child: Text(
                    _page < 2 ? 'onboarding_next'.tr() : 'onboarding_start'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _completeOnboarding(UserSettingsCollection current) async {
    final next = UserSettingsCollection()
      ..id = current.id
      ..themeMode = current.themeMode
      ..language = current.language
      ..rtlEnabled = current.rtlEnabled
      ..locationName = current.locationName
      ..latitude = current.latitude
      ..longitude = current.longitude
      ..calculationMethod = current.calculationMethod
      ..azanVolume = current.azanVolume
      ..vibrationOnReminder = current.vibrationOnReminder
      ..textSize = current.textSize
      ..onboardingCompleted = true
      ..updatedAt = DateTime.now();
    await ref.read(userSettingsProvider.notifier).saveSettings(next);
    await ref.read(locationSyncActionProvider)(force: true);
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xFF0D5C3A).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF0D5C3A), size: 48),
        ),
        const SizedBox(height: 26),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
