import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Listenable used by [GoRouter] to re-evaluate redirects when app state changes.
///
/// Call [notify] after auth, onboarding, or settings mutations in later phases.
final routerRefreshNotifierProvider = Provider<RouterRefreshNotifier>((ref) {
  final notifier = RouterRefreshNotifier();
  ref.onDispose(notifier.dispose);
  return notifier;
});

class RouterRefreshNotifier extends ChangeNotifier {
  void notifyRouter() => notifyListeners();
}
