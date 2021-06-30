import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/models/shop_bike.dart';
import 'package:flutter/material.dart';

class StoreViewModel extends ChangeNotifier {
  List<ShopBike> _shopBikes = [];

  List<ShopBike> get shopBikes => _shopBikes;

  bool existInShop(ShopBike shopBike) {
    return _shopBikes
        .where(
          (b) => b.bike.id == shopBike.bike.id,
        )
        .isNotEmpty;
  }

  void addToShop(
    Bike bike, {
    int qte = 1,
  }) {
    if (!existInShop(
      ShopBike(
        bike: bike,
        quantity: 1,
      ),
    )) {
      _shopBikes.add(ShopBike(
        bike: bike,
        quantity: 1,
      ));
    } else {
      final indexOf =
          _shopBikes.indexWhere((element) => element.bike.id == bike.id);
      _shopBikes[indexOf] =
          ShopBike(quantity: _shopBikes[indexOf].quantity + qte, bike: bike);
    }

    notifyListeners();
  }

  void quantityDownBike(Bike bike, int qte) {
    final indexOf =
        _shopBikes.indexWhere((element) => element.bike.id == bike.id);
    final newQuantity = _shopBikes[indexOf].quantity - qte;
    _shopBikes[indexOf] = ShopBike(bike: bike, quantity: newQuantity);
    if (newQuantity == 0) {
      deleteFromShop(_shopBikes[indexOf]);
    } else
      notifyListeners();
  }

  void deleteFromShop(ShopBike bike) {
    if (existInShop(bike)) {
      _shopBikes.remove(bike);
      notifyListeners();
    }
  }
}
