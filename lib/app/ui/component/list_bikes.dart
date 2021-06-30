import 'package:bikes_shop/app/common/internationalisation.dart';
import 'package:bikes_shop/app/common/search_text_field.dart';
import 'package:bikes_shop/app/common/utilities.dart';
import 'package:bikes_shop/app/ui/common/custom_tab_filter.dart';
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
    final bikeViewModel = context.read<BikesViewModel>();
    // Future<IResponse> future = useMemoized(() {
    //   if (bikeViewModel.future == null) bikeViewModel.retrieveBikes();
    //   return ;
    // });
    useEffect(() {
      bikeViewModel.initBikes();
    }, const []);
    return RefreshIndicator(
      notificationPredicate: (scrollNotif) {
        return true;
      },
      child: NestedScrollView(
        physics: ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: _HeaderBikeSearch(),
              toolbarHeight: 72,
              actions: [
                IconButton(
                  onPressed: () {
                    final bikeViewModel = context.read<BikesViewModel>();
                    bikeViewModel.changeView(!bikeViewModel.isList);
                  },
                  icon: Selector<BikesViewModel, bool>(
                    selector: (ctx, viewModel) => viewModel.isList,
                    builder: (ctx, isList, _) {
                      return Icon(
                        isList ? Icons.grid_view : Icons.view_list,
                        size: 32,
                        color: Colors.grey[700],
                      );
                    },
                  ),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(72.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: _FilterPriceWidget(),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
                            child: _FilterFramePriceRangeWidget(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      child: CustomTabFilter(
                        tabs: categories,
                        selectedCategory: (category) async {
                          bikeViewModel.saveCategory(category);
                          bikeViewModel.retrieveBikesByFilter();
                          // state.value = bikeViewModel.future!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              pinned: true,
              floating: false,
              snap: false,
            )
          ];
        },
        body: Stack(
          children: [
            Selector<BikesViewModel, Future<IResponse>>(
              selector: (ctx, bikesViewModel) => bikeViewModel.future!,
              builder: (ctx, future, _) {
                return MyFutureBuilderComponent<List<Bike>>(
                  key: Key(bikeViewModel.filter.toQuery()),
                  future: bikeViewModel.future!,
                  builder: (bikes) {
                    return _BikesWidget(
                      bikes: bikes,
                    );
                  },
                  mapTo: (response) {
                    return (response as BikesResponse).data!;
                  },
                );
              },
            )
          ],
        ),
      ),
      onRefresh: () async {
        bikeViewModel.retrieveBikesByFilter();
        //state.value = bikeViewModel.future!;
      },
    );
  }
}

class _HeaderBikeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0, top: 5.0),
        child: SearchTextField(
          radius: 24.0,
          textController: TextEditingController(),
          onTap: () {},
        ),
      ),
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
              mainAxisExtent: 256,
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
  }
}

class _FilterFramePriceRangeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Filter"),
            Icon(
              Icons.filter_alt,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}

class _FilterPriceWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedState = useState(false);
    final ascFilter = useState(false);
    return InkWell(
      onTap: () {
        if (!selectedState.value) selectedState.value = true;
        if (selectedState.value) ascFilter.value = !ascFilter.value;
        if (selectedState.value) {
          String filter = "asc";
          if (!ascFilter.value) {
            filter = "desc";
          }
          final bikesVM = context.read<BikesViewModel>();
          bikesVM.priceSortChange(filter);
          bikesVM.retrieveBikesByFilter();
        }
      },
      onDoubleTap: () {
        selectedState.value = false;
        final bikesVM = context.read<BikesViewModel>();
        bikesVM.priceSortChange("");
        bikesVM.retrieveBikesByFilter();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                BikeAppLocalizations.of(context)!.priceText,
              ),
              Icon(
                !selectedState.value
                    ? Icons.import_export_outlined
                    : ascFilter.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                size: 16,
              ),
            ],
          ),
          if (selectedState.value)
            Container(
                width: 35,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 3.0,
                      color: Colors.black,
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
