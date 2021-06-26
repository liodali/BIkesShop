/*
Bike name;
Bike category, e.g. Mountain bikes, City bikes, E-bikes etc;
Frame size;
List of pictures;
Price.
 */
class Bike {
  final int id;
  final String name;
  final String category;
  final String image;
  final double price;
  late BikeDetail bikeDetail;

  Bike({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
  });
}

class BikeDetail {
  final int idBike;
  final String description;
  final List<String> images;
  final String? color;
  final double size;

  BikeDetail({
    required this.idBike,
    required this.description,
    this.images = const [],
    this.color,
    required this.size,
  });
}
