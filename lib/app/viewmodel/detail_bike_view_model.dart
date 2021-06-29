import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/core/interactor/get_all_bikes_use_case.dart';
import 'package:bikes_shop/core/interactor/get_detail_bike_use_case.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

class DetailBikeViewModel extends ChangeNotifier {

  IResponse? _bikesResponse;
  Future<IResponse>? _futureBike;


  IResponse? get bikesResponse => _bikesResponse;

  Future<IResponse>? get future => _futureBike;

  DetailBikeViewModel();


  void retrieveBikeDetail(int idBike) {
    _futureBike = getIt<GetDetailBikeUseCase>().invoke(idBike);
  }
}
