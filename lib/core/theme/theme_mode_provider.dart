import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User-selected theme mode. Persisted to Isar in a later phase.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Accessibility text scale: 1.0 (normal), 1.1 (large), 1.22 (extra-large).
final textScaleFactorProvider = StateProvider<double>((ref) => 1.0);
