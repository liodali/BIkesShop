import 'package:bikes_shop/core/repository/base_repository.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

Future<IResponse> computeParserBikesJson(List<dynamic> data) async {
  return BikesResponse(data);
}

Future<IResponse> computeParserBikeJson(Map data) async {
  return DetailBikeResponse(data);
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
    return compute(computeParserBikesJson, data["data"] as List);
  }

  @override
  Future<IResponse> getAllByFilter(filter) {
    // TODO: implement getAllByFilter
    throw UnimplementedError();
  }

  @override
  Future<IResponse> getDetailBike(int idBike) async {
    Response<Map<String, dynamic>> response =
        await get(endpoint: "bike/$idBike");
    var data = response.data as Map<String, dynamic>;
    if (!data["success"]) {
      return ErrorResponse(error: "Error to get Data");
    }
    return compute(computeParserBikeJson, data["data"] as Map);
  }

  @override
  Future<IResponse> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
