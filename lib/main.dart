import 'package:espacogeekmobile/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import 'core/graphql/client.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/cubit/theme_state.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = await GraphQLClientFactory.create(endpoint: AppConstants.apiEndpoint);
  final themeCubit = ThemeCubit();
  runApp(MyApp(client: client, themeCubit: themeCubit));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  final ThemeCubit themeCubit;
  const MyApp({super.key, required this.client, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return GraphQLProvider(
            client: client,
            child: MaterialApp(
              onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeState.themeMode,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routes: AppRouter.routes,
              onGenerateRoute: AppRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
