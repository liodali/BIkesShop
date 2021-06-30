import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/domain/models/filter.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

class BikesViewModel extends ChangeNotifier {
  /// to change view of listview to grid when it's false
  bool _isList = true;

  bool _isLoading = false;
  FilterBikes _filter = FilterBikes();

  IResponse? _bikesResponse;
  Future<IResponse>? _futureBike;

  bool get isList => _isList;

  bool get isLoading => _isLoading;

  FilterBikes get filter => _filter;

  IResponse? get bikesResponse => _bikesResponse;

  Future<IResponse>? get future => _futureBike;

  BikesViewModel();

  void changeView(bool isList) {
    _isList = isList;
    notifyListeners();
  }

  Future<void> retrievePagingBikes() async {
    // _isLoading = true;
    // notifyListeners();
    // _bikesResponse = await getIt<GetAllBikesUseCase>().invoke(null);
    // _isLoading = false;
    // notifyListeners();
  }

  void initBikes() async {
    _futureBike = getIt<GetAllBikesUseCase>().invoke(null);
  }

  void saveCategory(String category) {
    Filter filterCategory = _filter.filters[FilterBikes.categoryLabel]!;
    filterCategory.value = category;
    _filter.filters[FilterBikes.categoryLabel] = filterCategory;
    notifyListeners();
  }

  void saveFrameSize(String frame) {
    Filter filterFrame = _filter.filters[FilterBikes.frameSizeLabel]!;
    filterFrame.value = frame;
    _filter.filters[FilterBikes.frameSizeLabel] = filterFrame;
    notifyListeners();
  }

  void savePriceRange(List<int> priceRange) {
    Filter filterPriceRange = _filter.filters[FilterBikes.priceRangeLabel]!;
    filterPriceRange.value = priceRange
        .map((e) => e.toString())
        .reduce((value, element) => "$value,$element");
    _filter.filters[FilterBikes.priceRangeLabel] = filterPriceRange;
    notifyListeners();
  }

  void priceSortChange(String priceSort) {
    Filter filterPrice = _filter.filters[FilterBikes.priceLabel]!;
    filterPrice.value = priceSort;
    _filter.filters[FilterBikes.priceLabel] = filterPrice;
    notifyListeners();
  }

  void retrieveBikes() async {
    _futureBike = getIt<GetAllBikesUseCase>().invoke(null);
    notifyListeners();
  }

  void retrieveBikesByFilter({String? query}) async {
    String? reqQuery = query;
    if (reqQuery == null) {
      reqQuery = _filter.toQuery();
    }
    _futureBike = getIt<GetAllBikesUseCase>().invoke(reqQuery);
    notifyListeners();
  }
}
