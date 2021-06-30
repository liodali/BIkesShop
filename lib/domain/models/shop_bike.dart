import 'bike.dart';

class ShopBike {
  final Bike bike;
  final int quantity;

  ShopBike({
    required this.bike,
    required this.quantity,
  });
}

extension ShopBikeExt on ShopBike {
  ShopBike copyWith({
    Bike? bike,
    int? qte,
  }) {
    return ShopBike(
      bike: bike ?? this.bike,
      quantity: qte ?? quantity,
    );
  }
}
