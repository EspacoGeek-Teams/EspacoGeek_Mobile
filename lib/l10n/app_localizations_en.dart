// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Espaço Geek';

  @override
  String get homeTitle => 'Espaço Geek';

  @override
  String get helloWorld => 'Hello, World!';

  @override
  String get randomIdea => 'A random idea:';

  @override
  String get generateNewIdea => 'Generate a new idea';

  @override
  String get search => 'Search';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchHint => 'Search media...';

  @override
  String get typeToSearch => 'Type to search';

  @override
  String get loading => 'Loading...';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get unknown => 'Unknown';

  @override
  String get noResults => 'No results';

  @override
  String get notFound => 'Not found';

  @override
  String get failedToLoad => 'Failed to load';

  @override
  String get season => 'Season';

  @override
  String episodes(String count) {
    return 'Episodes: $count';
  }
}
