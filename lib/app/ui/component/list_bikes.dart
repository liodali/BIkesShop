import 'package:bikes_shop/app/ui/common/my_future_builder_component.dart';
import 'package:bikes_shop/app/ui/widget/item_bike.dart';
import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ListBikes extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final Future<IResponse> future = useMemoized(() {
      final bikeViewModel = Provider.of<BikesViewModel>(context, listen: false);
      bikeViewModel.retrieveBikes();
      return bikeViewModel.future!;
    });
    return MyFutureBuilderComponent<List<Bike>>(
      future: future,
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
