// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../domain/models/bike.dart' as _i5;
import '../ui/pages/detail_bike.dart' as _i3;
import '../ui/pages/home.dart' as _i4;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    DetailBikeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailBikeRouteArgs>();
          return _i3.DetailBikePage(key: args.key, bike: args.bike);
        }),
    Home.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Home();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: 'store', fullMatch: true),
        _i1.RouteConfig(DetailBikeRoute.name, path: 'detail-bike'),
        _i1.RouteConfig(Home.name, path: 'store')
      ];
}

class DetailBikeRoute extends _i1.PageRouteInfo<DetailBikeRouteArgs> {
  DetailBikeRoute({_i2.Key? key, required _i5.Bike bike})
      : super(name,
            path: 'detail-bike',
            args: DetailBikeRouteArgs(key: key, bike: bike));

  static const String name = 'DetailBikeRoute';
}

class DetailBikeRouteArgs {
  const DetailBikeRouteArgs({this.key, required this.bike});

  final _i2.Key? key;

  final _i5.Bike bike;
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: 'store');

  static const String name = 'Home';
}
