import 'package:flutter/material.dart';

class FavoriteBikes extends StatefulWidget {
  FavoriteBikes({Key? key}) : super(key: key);

  @override
  _FavoriateBikesState createState() => _FavoriateBikesState();
}

class _FavoriateBikesState extends State<FavoriteBikes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("My Favoritee bikes"),
    );
  }
}