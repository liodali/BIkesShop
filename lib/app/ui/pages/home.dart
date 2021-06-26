import 'package:bikes_shop/app/ui/component/list_bikes.dart';
import 'package:bikes_shop/app/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoriate_bikes.dart';
import 'store_bike.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeViewModel = Provider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: NotificationListener(
        child: PageView(
          pageSnapping: false,
          restorationId: "viewPager",
          controller: homeViewModel.pageController,
          children: [
            StoreBike(),
            ListBikes(),
            FavoriteBikes(),
            ListBikes(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 0),
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
                  Provider.of<HomeViewModel>(context,listen: false).goTo(p);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    title: Text("Home"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.pedal_bike,
                    ),
                    title: Text("Home"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    title: Text("Home"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_grocery_store,
                    ),
                    title: Text("Home"),
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
