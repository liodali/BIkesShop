import 'package:bikes_shop/domain/models/bike.dart';
import 'package:bikes_shop/domain/repository/i_app_repository.dart';

abstract class IBikeRepository extends IAppRepository<Bike> {
  Future<BikeDetail> getDetailBike(int idBike);
}
