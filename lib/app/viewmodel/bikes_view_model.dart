import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

class BikesViewModel extends ChangeNotifier {

  bool _isLoading = false;
  IResponse? _bikesResponse;

  bool get isLoading => _isLoading;

  IResponse? get bikesResponse => _bikesResponse;

  BikesViewModel();

  Future<void> retrievePagingBikes() async {
    _isLoading = true;
    notifyListeners();
    _bikesResponse = await getIt<GetAllBikesUseCase>().invoke(null);
    _isLoading = false;
    notifyListeners();
  }
  Future<IResponse> retrieveBikes() async {
    return await getIt<GetAllBikesUseCase>().invoke(null);
  }
}
