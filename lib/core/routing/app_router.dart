import 'package:flutter/material.dart';
import 'package:espacogeekmobile/pages/home/home_page.dart';
import 'package:espacogeekmobile/pages/search/search_page.dart';
import 'package:espacogeekmobile/pages/search/search_route.dart';
import 'package:espacogeekmobile/pages/media/media_detail_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
        '/': (_) => const MyHomePage(),
        SearchRoute.routeName: (_) => const SearchPage(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
  }
}
