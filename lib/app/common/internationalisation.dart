import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BikeAppLocalizations {
  BikeAppLocalizations(this.locale);

  final Locale locale;

  static BikeAppLocalizations? of(BuildContext context) {
    return Localizations.of<BikeAppLocalizations>(
        context, BikeAppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title_app': 'Bike Shopping',
    },
    'fr': {
      'title_app': 'eBike Store',
    },
  };

  String get titleApp => _localizedValues[locale.languageCode]!['title_app']!;
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<BikeAppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<BikeAppLocalizations> load(Locale locale) {
    return SynchronousFuture<BikeAppLocalizations>(
        BikeAppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
