import 'package:auto_size_text/auto_size_text.dart';
import 'package:bikes_shop/app/viewmodel/detail_bike_view_model.dart';
import 'package:bikes_shop/domain/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailBikePage extends StatelessWidget {
  final Bike bike;

  const DetailBikePage({
    Key? key,
    required this.bike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DetailBikeViewModel(),
      builder: (ctx, _) {
        return Scaffold(
          appBar: AppBar(
            //title: Text(bike.name),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.local_grocery_store_outlined),
              )
            ],
          ),
          body: _BodyDetailBikeWidget(
            bike: bike,
          ),
        );
      },
    );
  }
}

class _BodyDetailBikeWidget extends StatelessWidget {
  final Bike bike;

  const _BodyDetailBikeWidget({
    Key? key,
    required this.bike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: [
                CachedNetworkImage(
                  imageUrl: bike.image,
                  width: MediaQuery.of(context).size.width,
                  imageBuilder: (ctx, imageProvider) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(0)),
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2.75,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.width / 2,
            child: DraggableScrollableSheet(
              initialChildSize: .87,
              minChildSize: .87,
              expand: false,
              builder: (ctx, controller) {
                return Card(
                  elevation: 25,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: _TitleDetailBikeWidget(
                                bikeName: bike.name,
                              ),
                            ),
                            Row(
                              children: [
                                _BadgeDetailBike(
                                  subtitle: "category",
                                  nameTitle: bike.category,
                                ),
                                _BadgeDetailBike(
                                  subtitle: "category",
                                  nameTitle: bike.category,
                                ),
                                _BadgeDetailBike(
                                  subtitle: "category",
                                  nameTitle: bike.category,
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: AutoSizeText.rich(
                                  TextSpan(
                                    text: "USD\n",
                                    children: [
                                      TextSpan(
                                        text: "${bike.price}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(224, 64),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text("Add to cart"),
                              ),
                              alignment: Alignment.bottomRight,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleDetailBikeWidget extends StatelessWidget {
  final String bikeName;

  const _TitleDetailBikeWidget({
    Key? key,
    required this.bikeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  bikeName,
                  maxLines: 2,
                  maxFontSize: 20,
                  minFontSize: 18,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.headline6!.copyWith(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border_outlined),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _BadgeDetailBike extends StatelessWidget {
  final String subtitle;
  final String nameTitle;

  const _BadgeDetailBike({
    Key? key,
    required this.subtitle,
    required this.nameTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                nameTitle,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
