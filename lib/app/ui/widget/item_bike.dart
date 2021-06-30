import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikes_shop/app/viewmodel/favorite_bikes_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/routes.gr.dart';

class ItemBike extends StatelessWidget {
  final Bike bike;
  final bool isGrid;

  ItemBike({
    required this.bike,
    this.isGrid = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeImage = 96.0;
    final children = [
      Expanded(
        flex: isGrid ? 4 : 2,
        child: _ImageItemBike(
          urlImage: bike.image,
          sizeImage: sizeImage,
          isGrid: isGrid,
        ),
      ),
      Expanded(
        flex: isGrid ? 2 : 4,
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            right: isGrid ? 8.0 : 3.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                bike.name,
                maxLines: isGrid ? 1 : 2,
                minFontSize: 12,
                maxFontSize: 17,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text("${bike.price}\$"),
            ],
          ),
        ),
      ),
      if (!isGrid)
        Expanded(
          flex: 1,
          child: SizedBox.shrink(),
        ),
    ];
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).navigate(
          DetailBikeRoute(bike: bike),
        );
      },
      child: Card(
        elevation: 1,
        child: Stack(
          children: [
            Container(
              height: isGrid ? null : sizeImage,
              padding: isGrid ? null : EdgeInsets.all(5.0),
              child: isGrid
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: children,
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
            ),
            if (!isGrid)
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    final favoriteVM = context.read<FavoriteBikesViewModel>();
                    if (favoriteVM.existFavorite(bike)) {
                      favoriteVM.removeFavorites(bike);
                    } else {
                      favoriteVM.addToFavorite(bike);
                    }
                  },
                  icon: Consumer<FavoriteBikesViewModel>(
                    builder: (ctx, favoriteVM, _) {
                      return Icon(
                        favoriteVM.existFavorite(bike)
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: favoriteVM.existFavorite(bike)
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      );
                    },
                  ),
                  iconSize: 24,
                ),
              ),
            Positioned(
              bottom: -8,
              right: 0,
              child: ElevatedButton(
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
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageItemBike extends StatelessWidget {
  final String urlImage;
  final double sizeImage;
  final bool isGrid;

  _ImageItemBike({
    required this.urlImage,
    this.sizeImage = 72,
    this.isGrid = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      colorBlendMode: BlendMode.clear,
      filterQuality: FilterQuality.medium,
      height: isGrid ? null : sizeImage,
      width: isGrid ? 256 : sizeImage,
      imageBuilder: (ctx, imageProvider) {
        return ClipRRect(
          borderRadius: isGrid
              ? BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                )
              : BorderRadius.circular(5.0),
          clipBehavior: Clip.hardEdge,
          child: Image(
            image: imageProvider,
            fit: isGrid ? BoxFit.fill : BoxFit.cover,
            height: isGrid ? null : sizeImage,
            width: isGrid ? null : sizeImage,
          ),
        );
      },
      placeholder: (ctx, _) => Center(
        child: Icon(
          Icons.pedal_bike_sharp,
          size: 48,
        ),
      ),
    );
  }
}
