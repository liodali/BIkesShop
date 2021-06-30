import 'package:bikes_shop/app/viewmodel/favorite_bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final Bike bike;

  FavoriteButtonWidget({
    Key? key,
    required this.bike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final favoriteVM = context.read<FavoriteBikesViewModel>();
        if (favoriteVM.existFavorite(bike)) {
          favoriteVM.removeFavorites(bike);
        } else {
          favoriteVM.addToFavorite(bike);
        }
      },
      icon: Consumer<FavoriteBikesViewModel>(
        builder: (ctx, favoriteVM, _) {
          return Icon(
            favoriteVM.existFavorite(bike)
                ? Icons.bookmark
                : Icons.bookmark_border_outlined,
            color: favoriteVM.existFavorite(bike)
                ? Theme.of(context).primaryColor
                : Colors.black,
          );
        },
      ),
      iconSize: 24,
    );
  }
}
