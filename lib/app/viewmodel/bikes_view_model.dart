import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class BikesViewModel extends ChangeNotifier {
  final GetAllBikesUseCase _getAllBikesUseCase;

  bool _isLoading = false;
  IResponse? _bikesResponse;

  bool get isLoading => _isLoading;

  IResponse? get bikesResponse => _bikesResponse;

  BikesViewModel(this._getAllBikesUseCase);

  Future<void> retrieveBikes() async {
    _isLoading = true;
    notifyListeners();
    _bikesResponse = await this._getAllBikesUseCase.invoke(null);
    _isLoading = false;
    notifyListeners();
  }
}
