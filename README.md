# espacogeekmobile

A Flutter mobile application for Espaço Geek.

## Features

- 🌓 **Light and Dark Theme Support**: Switch between light, dark, or system theme
- 🌍 **Internationalization**: Support for English and Portuguese
- 🔍 **Media Search**: Search and browse media content
- 📱 **Material Design 3**: Modern UI with Material Design 3

## Theme System

The app supports three theme modes:
- **Light Theme**: Bright color scheme
- **Dark Theme**: Dark color scheme  
- **System Theme**: Automatically follows device settings

To change the theme:
1. Tap the menu button (floating action button) on the home screen
2. Select the theme icon
3. Choose your preferred theme option

For more details, see [Theme System Documentation](docs/THEME_SYSTEM.md).

## Getting Started

### Prerequisites

- Flutter SDK 3.1.1 or higher
- Dart SDK

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build` to generate code
4. Run `flutter run` to start the app

## Development

### Code Generation

This project uses code generation for:
- Freezed (immutable state classes)
- Localization

To regenerate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Localization

To add a new language:
1. Create a new `.arb` file in `lib/l10n/`
2. Add translations
3. Run code generation

