import 'package:bikes_shop/domain/models/bike.dart';
import 'package:flutter/material.dart';

class FavoriteBikesViewModel extends ChangeNotifier {
  List<Bike> _bikesFavorites = [];

  List<Bike> get bikesFavorites => _bikesFavorites;

  bool existFavorite(Bike bike) {
    return _bikesFavorites
        .where(
          (b) => b.id == bike.id,
        )
        .isNotEmpty;
  }

  void addToFavorite(Bike bike) {
    if (!existFavorite(bike)) {
      _bikesFavorites.add(bike);
      notifyListeners();
    }
  }

  void removeFavorites(Bike bike) {
    if (existFavorite(bike)) {
      _bikesFavorites.remove(bike);
      notifyListeners();
    }
  }
}
