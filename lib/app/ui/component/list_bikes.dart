import 'package:bikes_shop/app/ui/common/my_future_builder_component.dart';
import 'package:bikes_shop/app/ui/widget/item_bike.dart';
import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListBikes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bikeViewModel = Provider.of<BikesViewModel>(context,listen: false);
    return MyFutureBuilderComponent<List<Bike>>(
      future: bikeViewModel.retrieveBikes(),
      builder: (bikes) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return ItemBike(
              bike: bikes[index],
            );
          },
          itemCount: bikes.length,
        );
      },
      mapTo: (response) {
        return (response as BikesResponse).data!;
      },
    );
  }
}
