import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/app/viewmodel/favorite_bikes_view_model.dart';
import 'package:bikes_shop/app/viewmodel/home_view_model.dart';
import 'package:bikes_shop/app/viewmodel/store_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/common/routes.dart';
import 'app/common/internationalisation.dart';
import 'app/common/locator.dart';

void main() {
  configureInjection();
  final _rootRouter = RootRouter();

  runApp(MultiProvider(
    providers: [
      ListenableProvider(
        create: (ctx) => BikesViewModel(),
      ),
      ListenableProvider(
        create: (ctx) => HomeViewModel(),
      ),
      ListenableProvider(
        create: (ctx) => FavoriteBikesViewModel(),
      ),
      ListenableProvider(
        create: (ctx) => StoreViewModel(),
      ),
    ],
    child: MyApp(
      router: _rootRouter,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final RootRouter router;

  const MyApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // onGenerateTitle: (ctx) {
      //   return BikeAppLocalizations.of(context)!.titleApp;
      // },
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      theme: ThemeData(
          primarySwatch: Colors.lime,
          primaryColorDark: Colors.lime[700],
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 3,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.grey,
          ),
          backgroundColor: Colors.grey[300]),
      //home: Home(),
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
