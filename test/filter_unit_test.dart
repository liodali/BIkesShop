
import 'package:bikes_shop/domain/models/filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("test filter",(){
    var filter = Filter(name: "category", value: [
      "cat1",
      "cat2",
      "cat3",
    ]);

    expect(filter.toQuery(), "category=cat1,cat2,cat3");
  });

  test("test filters categories&price",(){
    var filterBikes = FilterBikes();
    Filter  filterCategory = filterBikes.filters["category"]!;
    filterCategory.value="cat1";
    filterBikes.filters["category"] = filterCategory;

    Filter  filterPrice = filterBikes.filters["price"]!;
    filterPrice.value="asc";
    filterBikes.filters["price"] = filterPrice;

    expect(filterBikes.toQuery(),"category=cat1&price=asc");

  });
  test("test filters categories&price&frameSize",(){
    var filterBikes = FilterBikes();
    Filter  filterCategory = filterBikes.filters["category"]!;
    filterCategory.value="cat1";
    filterBikes.filters["category"] = filterCategory;

    Filter  filterPrice = filterBikes.filters["price"]!;
    filterPrice.value="asc";
    filterBikes.filters["price"] = filterPrice;

    Filter  filterFrame = filterBikes.filters["frameSize"]!;
    filterFrame.value="16,17";
    filterBikes.filters["frameSize"] = filterFrame;
    expect(filterBikes.toQuery(),"category=cat1&price=asc&frameSize=16,17");

  });

}