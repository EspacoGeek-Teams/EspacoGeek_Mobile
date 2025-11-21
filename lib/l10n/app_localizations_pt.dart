// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Espaço Geek';

  @override
  String get homeTitle => 'Espaço Geek';

  @override
  String get helloWorld => 'Olá, Mundo!';

  @override
  String get randomIdea => 'Uma ideia aleatória:';

  @override
  String get generateNewIdea => 'Gerar nova ideia';

  @override
  String get search => 'Buscar';

  @override
  String get searchTitle => 'Busca';

  @override
  String get searchHint => 'Buscar mídias...';

  @override
  String get typeToSearch => 'Digite para buscar';

  @override
  String get loading => 'Carregando...';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get noResults => 'Sem resultados';

  @override
  String get notFound => 'Não encontrado';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String get season => 'Temporada';

  @override
  String get theme => 'Tema';

  /// No description provided for @lightTheme.
  /// In pt, this message translates to:
  /// **'Tema Claro'**
  String get lightTheme => 'Tema Claro';

  /// No description provided for @darkTheme.
  /// In pt, this message translates to:
  /// **'Tema Escuro'**
  String get darkTheme => 'Tema Escuro';

  /// No description provided for @systemTheme.
  /// In pt, this message translates to:
  /// **'Tema do Sistema'**
  String get systemTheme => 'Tema do Sistema';

  @override
  String episodes(String count) {
    return 'Episódios: $count';
  }
}
