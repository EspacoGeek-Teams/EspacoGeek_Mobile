import 'package:espacogeekmobile/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:espacogeekmobile/l10n/app_localizations.dart';
import 'core/graphql/client.dart';
import 'pages/home/home_page.dart';
import 'pages/search/search_page.dart';
import 'pages/search/search_route.dart';
import 'pages/media/media_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client =
      await GraphQLClientFactory.create(endpoint: AppConstants.apiEndpoint);
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          '/': (_) => const MyHomePage(),
          SearchRoute.routeName: (_) => const SearchPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name != null && settings.name!.startsWith('/media/')) {
            final parts = settings.name!.split('/');
            if (parts.length >= 4) {
              final id = parts[2];
              final slug = parts[3];
              return MaterialPageRoute(
                builder: (_) => MediaDetailPage(id: id, slug: slug),
              );
            }
          }
          return null;
        },
      ),
    );
  }
}
