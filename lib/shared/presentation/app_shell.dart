import 'package:deentrack/core/constants/route_paths.dart';
import 'package:deentrack/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Root navigation shell with Stitch-inspired bottom bar structure.
///
/// Full visual fidelity will be applied when dashboard feature is built.
class AppShell extends StatelessWidget {
  const AppShell({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _DeenBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onSelected: _onTabSelected,
      ),
    );
  }
}

class _DeenBottomNavBar extends StatelessWidget {
  const _DeenBottomNavBar({
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 0, 14, 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.charcoalDark.withOpacity(0.95)
            : AppColors.slateNav.withOpacity(0.95),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.smartphone_outlined,
            label: 'nav_home'.tr(),
            selected: currentIndex == 0,
            onTap: () => onSelected(0),
          ),
          _NavItem(
            icon: Icons.alarm_outlined,
            label: 'nav_prayers'.tr(),
            selected: currentIndex == 1,
            onTap: () => onSelected(1),
          ),
          _CenterHomeButton(
            selected: currentIndex == 0,
            onTap: () => onSelected(0),
          ),
          _NavItem(
            icon: Icons.local_fire_department_outlined,
            label: 'nav_habits'.tr(),
            selected: currentIndex == 2,
            onTap: () => onSelected(2),
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            label: 'nav_settings'.tr(),
            selected: currentIndex == 3,
            onTap: () => onSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.greenAccent.shade400 : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterHomeButton extends StatelessWidget {
  const _CenterHomeButton({
    required this.selected,
    required this.onTap,
  });

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: AppColors.deepEmerald,
            shape: const CircleBorder(),
            elevation: selected ? 6 : 2,
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.slateNav,
                    width: 4,
                  ),
                  color: AppColors.deepEmerald,
                ),
                child: const Icon(Icons.home, color: Colors.white, size: 24),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'nav_home'.tr(),
            style: TextStyle(
              fontSize: 7.5,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
