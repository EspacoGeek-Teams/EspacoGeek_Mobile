# Theme System Documentation

This document describes the light and dark theme implementation in the EspacoGeek Mobile app.

## Architecture

The theme system uses the BLoC pattern with a `ThemeCubit` to manage theme state across the application.

### Components

1. **ThemeCubit** (`lib/core/theme/cubit/theme_cubit.dart`)
   - Manages the current theme mode (light, dark, or system)
   - Persists user preference using `flutter_secure_storage`
   - Automatically loads saved theme preference on app start

2. **ThemeState** (`lib/core/theme/cubit/theme_state.dart`)
   - Immutable state object using Freezed
   - Contains the current `ThemeMode` value

3. **AppTheme** (`lib/core/theme/app_theme.dart`)
   - Defines light and dark theme configurations
   - Uses Material Design 3
   - Both themes use the same seedColor (deepOrange) for consistency

4. **ThemeSwitcherDialog** (`lib/core/theme/widgets/theme_switcher_dialog.dart`)
   - UI component for theme selection
   - Provides radio buttons for Light, Dark, and System options
   - Localized in English and Portuguese

## How It Works

### Initialization
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = ThemeCubit();  // Creates cubit and loads saved preference
  runApp(MyApp(themeCubit: themeCubit));
}
```

### Theme Application
The `MyApp` widget wraps the MaterialApp with:
- `BlocProvider` to make ThemeCubit available throughout the app
- `BlocBuilder` to rebuild when theme changes
- `MaterialApp` with both `theme` and `darkTheme` configured
- `themeMode` bound to the current state

### User Interaction
Users can change the theme via:
1. Open the SpeedDial menu on the home page
2. Tap the theme icon (brightness_6)
3. Select Light, Dark, or System from the dialog
4. Theme changes immediately and preference is saved

## Theme Options

- **Light**: Uses light color scheme with deep orange accent
- **Dark**: Uses dark color scheme with deep orange accent
- **System**: Follows device system theme preference

## Storage

Theme preferences are stored securely using `flutter_secure_storage` with the key `theme_mode`.

## Localization

The theme UI supports both English and Portuguese:
- English: "Theme", "Light", "Dark", "System"
- Portuguese: "Tema", "Claro", "Escuro", "Sistema"
