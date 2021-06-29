import 'package:bikes_shop/domain/common/use_cases.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetDetailBikeUseCase implements FutureUseCase<int, IResponse> {
  final IBikeRepository _repository;

  GetDetailBikeUseCase(this._repository);

  @override
  Future<IResponse> invoke(int? parameter) {
    return this._repository.getDetailBike(parameter!);
  }
}
