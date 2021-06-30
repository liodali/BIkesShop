import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItemBike extends StatelessWidget {
  final String urlImage;
  final double sizeImage;
  final bool isGrid;

  ImageItemBike({
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
