import 'package:bikes_shop/domain/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemBike extends StatelessWidget {
  final Bike bike;

  ItemBike({
    required this.bike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: bike.image,
          colorBlendMode: BlendMode.clear,
          filterQuality: FilterQuality.medium,
          height: 56,
          width: 56,
          imageBuilder: (ctx, imageProvider) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                height: 56,
                width: 56,
              ),
            );
          },
          placeholder: (ctx, _) => Center(
            child: Icon(
              Icons.pedal_bike_sharp,
              size: 32,
            ),
          ),
        ),
        title: Text(
          bike.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text("${bike.price}\$"),
      ),
    );
  }
}
