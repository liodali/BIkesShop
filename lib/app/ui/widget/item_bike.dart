import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemBike extends StatelessWidget {
  final Bike bike;

  ItemBike({
    required this.bike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeImage = 96.0;
    return Card(
      elevation: 1,
      child: Stack(
        children: [
          Container(
            height: sizeImage,
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _ImageItemBike(
                    urlImage: bike.image,
                    sizeImage: sizeImage,
                  ),
                ),
                Expanded(
                  flex: 4,
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
                          maxLines: 2,
                          minFontSize: 14,
                          maxFontSize: 17,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("${bike.price}\$"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
              ],
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

  _ImageItemBike({
    required this.urlImage,
    this.sizeImage = 72,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      colorBlendMode: BlendMode.clear,
      filterQuality: FilterQuality.medium,
      height: sizeImage,
      width: sizeImage,
      imageBuilder: (ctx, imageProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            height: sizeImage,
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
