import 'package:bikes_shop/core/repository/base_repository.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBikeRepository)
class BikeRepository with BaseRepository implements IBikeRepository {
  @override
  Future<IResponse> getAll() async {
    var response = await get(endpoint: "bikes/all");

    return BikesResponse(response.data as List<Map<String, dynamic>>);
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
