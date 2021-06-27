import 'package:bikes_shop/app/ui/common/my_future_builder_component.dart';
import 'package:bikes_shop/app/ui/widget/item_bike.dart';
import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ListBikes extends HookWidget {
  ListBikes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bikeViewModel = Provider.of<BikesViewModel>(context, listen: false);
    Future<IResponse> future = useMemoized(() {
      if (bikeViewModel.future == null) bikeViewModel.retrieveBikes();
      return bikeViewModel.future!;
    });
    final state = useState(future);
    return RefreshIndicator(
      notificationPredicate: (scrollNotif) {
        print(scrollNotif.depth);
        return true;
      },
      child: MyFutureBuilderComponent<List<Bike>>(
        future: state.value,
        builder: (bikes) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
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
      ),
      onRefresh: () async {
        bikeViewModel.retrieveBikes();
        state.value = bikeViewModel.future!;
      },
    );
  }
}
