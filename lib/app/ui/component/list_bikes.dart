import 'package:bikes_shop/app/common/search_text_field.dart';
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
        return false;
      },
      child: MyFutureBuilderComponent<List<Bike>>(
        future: state.value,
        builder: (bikes) {
          return NestedScrollView(
            physics: ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  title: _HeaderBikeSearch(),
                  toolbarHeight: 64,
                  pinned: true,
                  floating: false,
                  snap: false,
                )
              ];
            },
            body: _BikesWidget(
              bikes: bikes,
            ),
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

class _HeaderBikeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchTextField(
            textController: TextEditingController(),
            onTap: () {},
          ),
        ),
        IconButton(
          onPressed: () {
            final bikeViewModel = context.read<BikesViewModel>();
            bikeViewModel.changeView(!bikeViewModel.isList);
          },
          icon: Selector<BikesViewModel, bool>(
            selector: (ctx, viewModel) => viewModel.isList,
            builder: (ctx, isList, _) {
              return Icon(
                isList ? Icons.view_comfortable : Icons.view_list,
                size: 24,
                color: Colors.grey[700],
              );
            },
          ),
        )
      ],
    );
  }
}

class _BikesWidget extends StatelessWidget {
  final List<Bike> bikes;

  _BikesWidget({
    Key? key,
    required this.bikes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<BikesViewModel, bool>(
      selector: (ctx, viewModel) => viewModel.isList,
      builder: (ctx, isList, child) {
        var widget = child!;
        if (!isList) {
          widget = GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 256
            ),
            itemCount: bikes.length,
            itemBuilder: (ctx, index) {
              return ItemBike(
                bike: bikes[index],
                isGrid: true,
              );
            },
          );
        }
        return widget;
      },
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ItemBike(
            bike: bikes[index],
          );
        },
        itemCount: bikes.length,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
      ),
    );
    // return SliverList(
    //   delegate: SliverChildBuilderDelegate(
    //     (ctx, index) {
    //       return ItemBike(
    //         bike: bikes[index],
    //       );
    //     },
    //     addAutomaticKeepAlives: true,
    //     childCount: bikes.length,
    //   ),
    // );
  }
}
