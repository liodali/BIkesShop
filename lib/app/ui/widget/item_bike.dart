import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    final sizeImage = isGrid ? 128.0 : 96.0;
    final children = [
      Expanded(
        flex: isGrid ? 4 : 2,
        child: _ImageItemBike(
          urlImage: bike.image,
          sizeImage: sizeImage,
        ),
      ),
      Expanded(
        flex: isGrid ? 2 : 4,
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
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
    return Card(
      elevation: 1,
      child: Stack(
        children: [
          Container(
            height: isGrid ? sizeImage * 2 : sizeImage,
            padding: EdgeInsets.all(5.0),
            child: isGrid
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: children,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    children: children,
                  ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              ),
              iconSize: 24,
            ),
          ),
          Positioned(
            bottom: -5,
            right: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(16.0)))),
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          )
        ],
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
      height: isGrid ? sizeImage * 1.5 : sizeImage,
      width: sizeImage,
      imageBuilder: (ctx, imageProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            height: isGrid ? sizeImage * 1.5 : sizeImage,
            width: sizeImage,
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
