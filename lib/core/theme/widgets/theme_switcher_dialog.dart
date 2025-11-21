import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import '../cubit/theme_cubit.dart';

class ThemeSwitcherDialog extends StatelessWidget {
  const ThemeSwitcherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeCubit = context.read<ThemeCubit>();
    final currentTheme = context.watch<ThemeCubit>().state.themeMode;

    return AlertDialog(
      title: Text(l10n.theme),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ThemeMode>(
            title: Text(l10n.lightTheme),
            value: ThemeMode.light,
            groupValue: currentTheme,
            onChanged: (value) {
              if (value != null) {
                themeCubit.setThemeMode(value);
                Navigator.of(context).pop();
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.darkTheme),
            value: ThemeMode.dark,
            groupValue: currentTheme,
            onChanged: (value) {
              if (value != null) {
                themeCubit.setThemeMode(value);
                Navigator.of(context).pop();
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.systemTheme),
            value: ThemeMode.system,
            groupValue: currentTheme,
            onChanged: (value) {
              if (value != null) {
                themeCubit.setThemeMode(value);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
