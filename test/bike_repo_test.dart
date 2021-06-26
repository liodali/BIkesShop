import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  configureInjection();

  test("test All bikes", () async {
    final repository = getIt<IBikeRepository>();


    BikesResponse bikes = (await repository.getAll()) as BikesResponse;

    expect(bikes.data!.length, 50);
  });
}
