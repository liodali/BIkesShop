import 'package:bikes_shop/domain/models/bike.dart';
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
        title: Text(bike.name),
        trailing: Text("${bike.price}\$"),
      ),
    );
  }
}
