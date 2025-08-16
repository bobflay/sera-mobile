# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Sera is a Flutter application supporting Android, iOS, and Web platforms.
- Flutter SDK: ^3.8.1
- Dart language
- Package name: `sera`
- Current version: 1.0.0+1

## Essential Commands

### Development
```bash
flutter run                    # Run the app in debug mode
flutter run -d chrome         # Run on web browser
flutter run --release         # Run in release mode
flutter run --verbose         # Run with verbose output for debugging
```

### Testing
```bash
flutter test                   # Run all tests
flutter test test/widget_test.dart  # Run specific test file
flutter test --name "Counter increments"  # Run test by name pattern
flutter test --coverage       # Generate coverage report
```

### Building
```bash
flutter build apk             # Build Android APK
flutter build appbundle       # Build Android App Bundle
flutter build ios             # Build iOS (requires macOS with Xcode)
flutter build ipa             # Build iOS archive
flutter build web             # Build for web deployment
```

### Code Quality
```bash
flutter analyze               # Run static analysis
dart format .                 # Format all Dart files
dart format lib/main.dart     # Format specific file
dart fix --apply             # Apply automated fixes
flutter doctor                # Check Flutter environment setup
flutter clean                 # Clean build artifacts
flutter pub get               # Install dependencies
flutter pub upgrade           # Upgrade dependencies
```

## Architecture

The application currently uses a basic Flutter starter template with:

- **MyApp** (lib/main.dart:7): Root StatelessWidget that configures MaterialApp
  - Uses Material 3 design with seed color: Colors.deepPurple
  - Title: 'Flutter Demo'
  
- **MyHomePage** (lib/main.dart:38): StatefulWidget for the home screen
  - Takes a required `title` parameter
  
- **_MyHomePageState** (lib/main.dart:56): State management using setState
  - Counter state stored in `_counter` field
  - `_incrementCounter()` method updates state

State management uses Flutter's built-in setState. The counter demo includes hot reload comments demonstrating Flutter's stateful hot reload capabilities.

## Platform Configuration

### Android (android/)
- Gradle build system with Kotlin DSL (.kts files)
- Application ID: `com.example.sera` (TODO: change before release)
- Min SDK: flutter.minSdkVersion (typically 21)
- Target SDK: flutter.targetSdkVersion (typically latest)
- Compile SDK: flutter.compileSdkVersion
- Java version: 11
- Signing: Debug keys only (TODO: add release signing)
- MainActivity: Kotlin-based at `com.example.sera.MainActivity`

### iOS (ios/)
- Bundle identifier: `com.example.sera`
- Deployment target: iOS 12.0
- Display name: "Sera"
- Supported orientations: Portrait, Landscape (both)
- iPad support enabled
- Uses standard Flutter iOS runner configuration

### Web (web/)
- PWA-enabled with manifest.json
- Theme color: #0175C2
- Display mode: standalone
- Orientation: portrait-primary
- Icons configured for 192x192 and 512x512 (including maskable)

## Testing

The project includes a basic widget test at test/widget_test.dart that:
- Verifies initial counter value is 0
- Tests increment functionality
- Uses WidgetTester for interaction simulation

## Dependencies

Production:
- flutter SDK
- cupertino_icons: ^1.0.8

Development:
- flutter_test SDK
- flutter_lints: ^5.0.0

## Linting

Uses flutter_lints package with standard Flutter analysis options defined in analysis_options.yaml. The project follows Flutter's recommended lint rules.