import 'package:flutter/widgets.dart';

/// Performs one-time application initialization before [runApp].
Future<void> bootstrap(Future<void> Function() runAppCallback) async {
  WidgetsFlutterBinding.ensureInitialized();
  await runAppCallback();
}
