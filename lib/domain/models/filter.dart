import 'dart:ffi';

import 'package:bikes_shop/app/common/utilities.dart';

class FilterBikes {
  String priceFilter = "asc";
  String category = categories.first;
  List<Double> priceRange = [];

  String toQuery() {
    String query = "";
    if (category != categories.first) {
      query = "category=$category";
    }
    if (query.isNotEmpty) {
      query += "&";
    }
    if (priceFilter.isNotEmpty) {
      query += "&price=$priceFilter";
    }
    return query;
  }
}
