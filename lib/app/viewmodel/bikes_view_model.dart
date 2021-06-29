import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

class BikesViewModel extends ChangeNotifier {
  bool _isList = true;

  bool get isList => _isList;

  void changeView(bool isList) {
    _isList = isList;
    notifyListeners();
  }

  bool _isLoading = false;
  IResponse? _bikesResponse;
  Future<IResponse>? _futureBike;

  bool get isLoading => _isLoading;

  IResponse? get bikesResponse => _bikesResponse;

  Future<IResponse>? get future => _futureBike;

  BikesViewModel();

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
  void retrieveBikes() async {
    _futureBike = getIt<GetAllBikesUseCase>().invoke(null);
    notifyListeners();
  }

  void retrieveBikesByFilter(String query) async {
    _futureBike = getIt<GetAllBikesUseCase>().invoke(query);
    notifyListeners();
  }
}
