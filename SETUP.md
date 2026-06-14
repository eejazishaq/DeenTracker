# DeenTrack — Local Setup

Flutter SDK is required (installed at `C:\flutter` on this machine — add `C:\flutter\bin` to PATH).

If platform folders (`android/`, `ios/`) are missing:

```bash
flutter create . --org com.deentrack --project-name deentrack
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Prayer engine tests

```bash
flutter test test/core/services test/features/prayers
```

## Code generation

Isar collection schemas are generated into `*.g.dart` files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```
