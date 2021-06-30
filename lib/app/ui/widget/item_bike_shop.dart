import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikes_shop/app/ui/common/favorite_button.dart';
import 'package:bikes_shop/app/ui/common/image_item_bike.dart';
import 'package:bikes_shop/app/viewmodel/favorite_bikes_view_model.dart';
import 'package:bikes_shop/app/viewmodel/store_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/models/shop_bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/routes.gr.dart';

class ItemBikeShop extends StatelessWidget {
  final ShopBike shopBike;

  ItemBikeShop({
    required this.shopBike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeImage = 96.0;
    final children = [
      Expanded(
        flex: 2,
        child: ImageItemBike(
          urlImage: shopBike.bike.image,
          sizeImage: sizeImage,
          isGrid: false,
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            right: 3.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                shopBike.bike.name,
                maxLines: 2,
                minFontSize: 12,
                maxFontSize: 17,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text("${shopBike.bike.price}\$"),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: SizedBox.shrink(),
      ),
    ];
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).navigate(
          DetailBikeRoute(bike: shopBike.bike),
        );
      },
      child: Card(
        elevation: 1,
        child: Stack(
          children: [
            Container(
              height: sizeImage,
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: FavoriteButtonWidget(
                bike: shopBike.bike,
              ),
            ),
            Positioned(
              bottom: -8,
              right: 0,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(0.0),
                      minimumSize: Size(48, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      final storeViewModel = context.read<StoreViewModel>();
                      storeViewModel.addToShop(shopBike.bike);
                    },
                    child: Icon(Icons.add),
                  ),
                  Container(
                    width: 48,
                    height: 32,
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    child: Text("${shopBike.quantity}"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(0.0),
                      minimumSize: Size(48, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      final storeViewModel = context.read<StoreViewModel>();
                      storeViewModel.quantityDownBike(shopBike.bike, 1);
                    },
                    child: Icon(Icons.remove),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
