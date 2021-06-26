import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/app/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/common/internationalisation.dart';
import 'app/ui/pages/home.dart';
import 'app/common/locator.dart';

void main() {
  configureInjection();
  runApp(MultiProvider(
    providers: [
      ListenableProvider(
        create: (ctx) => BikesViewModel(),
      ),
      ListenableProvider(
        create: (ctx) => HomeViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateTitle: (ctx) {
      //   return BikeAppLocalizations.of(context)!.titleApp;
      // },
      theme: ThemeData(
        primarySwatch: Colors.lime,
        primaryColorDark: Colors.lime[700],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 3,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
        ),
        backgroundColor: Colors.grey[300]
      ),
      home: Home(),
      navigatorKey: Get.key,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('fr', ''), // English, no country code
      ],
    );
  }
}
