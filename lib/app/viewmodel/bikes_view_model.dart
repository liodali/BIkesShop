import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

class BikesViewModel extends ChangeNotifier {
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

  void retrieveBikes() {
    _futureBike = getIt<GetAllBikesUseCase>().invoke(null);
  }
}
