import 'dart:ffi';

import 'package:bikes_shop/domain/common/utilities.dart';

class Filter {
  late String name;

  dynamic value;

  Filter({
    required this.name,
    this.value,
  });

  String _valueList() {
    String filterValue = "";
    if ((value as List).isNotEmpty) {
      filterValue =
          (value as List).reduce((value, element) => "$value,$element");
    }
    return "$name=$filterValue";
  }

  bool isAdded() {
    if (value is List)
      return (value as List).isNotEmpty;
    else {
      return value != null && (value as String).isNotEmpty;
    }
  }

  String toQuery() {
    if (value != null) {
      var filterValue = "$value";
      if (value is List) {
        return _valueList();
      }
      if (name.isNotEmpty)
        return "$name=$filterValue";
      else
        return filterValue;
    }
    return "";
  }
}

class FilterBikes {
  Map<String, Filter> filters = {
    "category": Filter(
      name: "category",
      value: "All",
    ),
    "price": Filter(
      name: "price",
      value: "",
    ),
    "priceRange": Filter(
      name: "priceRange",
      value: "",
    ),
    "frameSize": Filter(
      name: "frameSize",
      value: "",
    ),
  };

  static const String categoryLabel = "category";
  static const String priceLabel = "price";
  static const String priceRangeLabel = "priceRange";
  static const String frameSizeLabel = "frameSize";

  String toQuery() {
    var q = filters.entries.map((e) => e.value).toList();

    final filterQuery = q.where((element) => element.isAdded()).reduce(
        (value, element) => Filter(
            name: "",
            value: element.toQuery().isNotEmpty
                ? "${value.toQuery()}&${element.toQuery()}"
                : "${value.toQuery()}"));

    return filterQuery.toQuery();
  }
}
