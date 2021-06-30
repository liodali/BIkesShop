import 'package:bikes_shop/app/common/internationalisation.dart';
import 'package:bikes_shop/app/ui/common/empty_list_widget.dart';
import 'package:bikes_shop/app/ui/widget/item_bike_shop.dart';
import 'package:bikes_shop/app/viewmodel/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class PurchaseBikes extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              BikeAppLocalizations.of(context)!.purchaseBikes,
            ),
            toolbarHeight: 72,
            actions: [
              TextButton(
                child: Text(
                    BikeAppLocalizations.of(context)!.purchaseCheckoutText),
                onPressed: () {},
              )
            ],
            primary: true,
            bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        BikeAppLocalizations.of(context)!.purchasePriceText,
                      ),
                    ),
                    Consumer<StoreViewModel>(
                      builder: (ctx, storeVM, _) {
                        final price = storeVM.totalPrice;
                        return Text(
                          "$price\$",
                          style: TextStyle(
                            color:
                                price == "0" ? Colors.grey[400] : Colors.black,
                            fontSize: price == "0" ? 17 : 15,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(64),
            ),
            pinned: true,
            floating: false,
            snap: false,
          )
        ];
      },
      body: Consumer<StoreViewModel>(
        builder: (ctx, storeBikesVM, child) {
          if (storeBikesVM.shopBikes.isEmpty) {
            return child!;
          }
          return ListView.builder(
            itemCount: storeBikesVM.shopBikes.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return ItemBikeShop(
                shopBike: storeBikesVM.shopBikes[index],
              );
            },
          );
        },
        child: EmptyListWidget(
          emptyMessageText:
              BikeAppLocalizations.of(context)!.noPurchaseBikesText,
        ),
      ),
    );
  }
}
