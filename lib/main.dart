import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app/common/internationalisation.dart';
import 'app/common/locator.dart';

void main() {
  configureInjection();
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (ctx) => BikesViewModel(),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
      navigatorKey: Get.key,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('fr', ''), // English, no country code
      ],
    );
  }
}
