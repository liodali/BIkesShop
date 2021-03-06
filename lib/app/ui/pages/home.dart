import 'package:bikes_shop/app/ui/component/list_bikes.dart';
import 'package:bikes_shop/app/ui/component/purchase_bikes.dart';
import 'package:bikes_shop/app/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../component/favorite_bikes.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late HomeViewModel homeViewModel;
  late AnimationController controllerAnim;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controllerAnim = new AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 75.0).animate(controllerAnim);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeViewModel = Provider.of<HomeViewModel>(context);
  }

  @override
  void dispose() {
    controllerAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("Home"),
      //   elevation: 0,
      // ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            controllerAnim.forward();
          } else if (notification.direction == ScrollDirection.forward) {
            controllerAnim.reverse();
          } else {}
          if (notification.metrics.atEdge &&
              notification.metrics.pixels >=
                  notification.metrics.maxScrollExtent - 150) {
            controllerAnim.reverse();
          }

          return true;
        },
        child: PageView(
          pageSnapping: false,
          controller: homeViewModel.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListBikes(),
            FavoriteBikes(),
            PurchaseBikes(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedBuilder(
        animation: animation,
        builder: (ctx, child) {
          return Transform.translate(
            offset: Offset(0, animation.value),
            child: child,
          );
        },
        child: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (ctx, home) => home.indexPage,
      builder: (ctx, page, _) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 20.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                currentIndex: page,
                iconSize: 24,
                unselectedFontSize: 14,
                selectedFontSize: 16,
                type: BottomNavigationBarType.shifting,
                showSelectedLabels: false,
                onTap: (p) {
                  Provider.of<HomeViewModel>(context, listen: false).goTo(p);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    label: "Favorite Bikes",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_grocery_store,
                    ),
                    label: "Purchase",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
