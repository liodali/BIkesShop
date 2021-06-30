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
      'reset_text': "reset",
      'apply_text': "Apply",
      "purchase_bikes": "Purchase Bikes",
      "favorite_bikes": "Your Favorite Bikes",
      "no_purchase_bikes_text": "No  Bike in the Store  for now",
      "no_favorite_bikes_text": "No Favorite Bike found for now",
    },
    'fr': {
      'title_app': 'eBike Store',
      'loading_text': 'Changement ...',
      'price_text': "Prix",
      'reset_text': "Réinitialiser",
      'apply_text': "Approuver",
      'purchase_bikes': "Panier",
      'favorite_bikes': "Vos Bikes Favories",
      'no_purchase_bikes_text': "Aucune  Bike dans panier ",
      'no_favorite_bikes_text': "Aucune Favorite Bike ",
    },
  };

  String get titleApp => _localizedValues[locale.languageCode]!['title_app']!;
  String get loadingText => _localizedValues[locale.languageCode]!['loading_text']!;
  String get priceText => _localizedValues[locale.languageCode]!['price_text']!;
  String get resetText => _localizedValues[locale.languageCode]!['reset_text']!;
  String get applyText => _localizedValues[locale.languageCode]!['apply_text']!;
  String get purchaseBikes => _localizedValues[locale.languageCode]!['purchase_bikes']!;
  String get favoriteBikes => _localizedValues[locale.languageCode]!['favorite_bikes']!;
  String get noPurchaseBikesText => _localizedValues[locale.languageCode]!['no_purchase_bikes_text']!;
  String get noFavoriteBikesText => _localizedValues[locale.languageCode]!['no_favorite_bikes_text']!;
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
