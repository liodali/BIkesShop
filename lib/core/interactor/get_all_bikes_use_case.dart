import 'package:bikes_shop/domain/common/use_cases.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllBikesUseCase implements FutureUseCase<dynamic, IResponse> {
  final IBikeRepository _repository;

  GetAllBikesUseCase(this._repository);

  @override
  Future<IResponse> invoke(dynamic parameter) {
    if (parameter != null) {
      return this._repository.getAllByFilter(parameter);
    }
    return this._repository.getAll();
  }
}
