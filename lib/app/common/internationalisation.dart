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
      'loading_text': 'Loading ...',
      'price_text': "Price",
    },
    'fr': {
      'title_app': 'eBike Store',
      'loading_text': 'Changement ...',
      'price_text': "Prix",
    },
  };

  String get titleApp => _localizedValues[locale.languageCode]!['title_app']!;
  String get loadingText => _localizedValues[locale.languageCode]!['loading_text']!;
  String get priceText => _localizedValues[locale.languageCode]!['price_text']!;
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
