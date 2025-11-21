# espacogeekmobile

A concise Flutter mobile app for Espaço Geek. This repository contains the mobile client implemented with Flutter and Dart.

## Table of contents

- [Project](#project)
- [Requirements](#requirements)
- [Getting started](#getting-started)
- [Run](#run)
- [Build](#build)
- [Testing](#testing)
- [Localization](#localization)
- [Project structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Project

This is the Espaço Geek mobile application. It provides the mobile UI, routing, localization, and platform-specific integration for Android and iOS.

## Requirements

- Flutter (stable channel) compatible with the project (see `pubspec.yaml`)
- Android SDK (for Android builds)
- Xcode (for iOS builds, macOS only)

## Getting started

1. Clone the repository:

   git clone <repo-url>

2. Enter the project folder and fetch dependencies:

   cd EspacoGeek_Mobile
   flutter pub get

3. Configure platform-specific settings if needed (`android/local.properties`, signing configs, etc.).

## Run

- Run on an attached Android device or emulator:

  flutter run

- Run on iOS (macOS with Xcode installed):

  flutter run -d <device-id>

## Build

- Android APK:

  flutter build apk --release

- Android App Bundle:

  flutter build appbundle --release

- iOS (archive using Xcode):

  flutter build ipa

## Testing

- Run unit and widget tests:

  flutter test

## Localization

Localization files live in `l10n/`. The project already includes ARB and generated localization classes. If you change ARB files, run the generation step configured in the project (check `pubspec.yaml` and the `l10n` configuration).

## Project structure (high level)

- `lib/` — application source
  - `main.dart` — app entry point
  - `pages/` — UI pages
  - `core/` — core services (routing, graphql, etc.)
  - `constants/` — app constants and styles
- `android/`, `ios/` — platform folders
- `l10n/` — localization resources

## Contributing

Contributions are welcome. Open an issue or submit a pull request with a clear description of changes and testing steps.

## License

This project is licensed under the terms in the `LICENSE` file.

