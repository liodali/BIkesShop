import 'package:auto_route/annotations.dart';
import 'package:bikes_shop/app/ui/pages/detail_bike.dart';
import 'package:bikes_shop/app/ui/pages/home.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "detail-bike",
      page: DetailBikePage,
    ),
    AutoRoute(
      path: "store",
      page: Home,
      initial: true,
    ),
  ],
)
class $RootRouter {}
