import 'package:bikes_shop/core/repository/base_repository.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

Future<IResponse> computeJson(data) async {
  return BikesResponse(
    data,
  );
}

@LazySingleton(as: IBikeRepository)
class BikeRepository with BaseRepository implements IBikeRepository {
  @override
  Future<IResponse> getAll() async {
    Response<Map<String, dynamic>> response = await get(endpoint: "bikes/all");
    var data = response.data as Map<String, dynamic>;
    if (!data["success"]) {
      return ErrorResponse(error: "Error to get Data");
    }
    return compute(computeJson, data["data"]);
  }

  @override
  Future<IResponse> getAllByFilter(filter) {
    // TODO: implement getAllByFilter
    throw UnimplementedError();
  }

  @override
  Future<IResponse> getDetailBike(int idBike) {
    // TODO: implement getDetailBike
    throw UnimplementedError();
  }

  @override
  Future<IResponse> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
