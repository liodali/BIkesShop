import 'package:bikes_shop/domain/models/response.dart';

abstract class IAppRepository<T> {
  Future<IResponse> getAll();

  Future<IResponse> getAllByFilter(dynamic filter);

  Future<IResponse> getOne(int id);
}
