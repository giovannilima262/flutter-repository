import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'RepoFluApp',
      'save_repo': 'Save repo',
      'saved_repositories': 'Saved Repositories',
      'fetch_failed': 'Fetch failed',
    },
    'pt': {
      'app_name': 'RepoFluApp',
      'save_repo': 'Salvar Repositório',
      'saved_repositories': 'Repositórios Salvos',
      'fetch_failed': 'Falha na busca',
    },
  };

  String get appName {
    return _localizedValues[locale.languageCode]['app_name'];
  }

  String get saveRepo {
    return _localizedValues[locale.languageCode]['save_repo'];
  }

  String get savedRepositories {
    return _localizedValues[locale.languageCode]['saved_repositories'];
  }

  String get fetchFailed {
    return _localizedValues[locale.languageCode]['fetch_failed'];
  }
}
