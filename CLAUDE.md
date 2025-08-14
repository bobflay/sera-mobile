# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Sera is a Flutter cross-platform application that supports Android, iOS, and Web platforms. Currently using Flutter SDK >=3.8.1 <4.0.0 with Dart language.

## Essential Commands

### Development
```bash
flutter run                    # Run the app in debug mode
flutter run -d chrome         # Run on web browser
flutter run --release         # Run in release mode
```

### Testing
```bash
flutter test                   # Run all tests
flutter test test/widget_test.dart  # Run specific test file
flutter test --name "Counter increments"  # Run test by name pattern
```

### Building
```bash
flutter build apk             # Build Android APK
flutter build ios             # Build iOS (requires macOS with Xcode)
flutter build web             # Build for web deployment
```

### Code Quality
```bash
flutter analyze               # Run static analysis
dart format .                 # Format all Dart files
dart format lib/main.dart     # Format specific file
flutter doctor                # Check Flutter environment setup
```

## Project Structure

```
sera/
├── lib/
│   └── main.dart            # Main application entry point and UI
├── test/
│   └── widget_test.dart     # Widget tests
├── android/                 # Android-specific configuration
├── ios/                     # iOS-specific configuration  
├── web/                     # Web-specific configuration
└── pubspec.yaml            # Flutter dependencies and metadata
```

## Architecture

The application currently follows Flutter's basic StatefulWidget pattern:

- **MyApp**: Root widget that sets up MaterialApp with Material Design 3 theme
- **MyHomePage**: Stateful widget implementing the main UI
- **_MyHomePageState**: State class managing the counter logic with setState

State management uses Flutter's built-in setState method. For more complex features, consider implementing proper state management (Provider, Riverpod, Bloc, etc.).

## Platform-Specific Notes

- **Android**: Minimum SDK 21, target SDK 35, uses Material 3 design
- **iOS**: Deployment target 12.0, configured for both iPhone and iPad
- **Web**: PWA-enabled with manifest.json and service worker

## Development Considerations

1. Application identifier is currently `com.example.sera` - must be changed before production release
2. Debug signing is configured for Android development
3. The project uses flutter_lints for code quality enforcement
4. Hot reload is available during development with `flutter run`