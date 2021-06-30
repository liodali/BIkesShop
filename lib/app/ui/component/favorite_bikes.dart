import 'package:bikes_shop/app/ui/widget/item_bike.dart';
import 'package:bikes_shop/app/viewmodel/favorite_bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class FavoriteBikes extends HookWidget {
  FavoriteBikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text("Favorite Bikes"),
            toolbarHeight: 72,
            actions: [],
            pinned: true,
            floating: false,
            snap: false,
          )
        ];
      },
      body: Consumer<FavoriteBikesViewModel>(
        builder: (ctx, favoriteVM, child) {
          if (favoriteVM.bikesFavorites.isEmpty) {
            return child!;
          }
          return ListView.builder(
            itemCount: favoriteVM.bikesFavorites.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return ItemBike(
                bike: favoriteVM.bikesFavorites[index],
              );
            },
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No Favorite Bike found for now",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
