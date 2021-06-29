import 'package:bikes_shop/app/common/locator.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:bikes_shop/domain/repository/i_bike_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  configureInjection();

  test("test All bikes", () async {
    final repository = getIt<IBikeRepository>();

    BikesResponse bikes = (await repository.getAll()) as BikesResponse;

    expect(bikes.data!.length, 50);
  });
  test("test detail bike", () async {
    final repository = getIt<IBikeRepository>();

    DetailBikeResponse detailBike =
        (await repository.getDetailBike(1)) as DetailBikeResponse;

    expect(detailBike.data!.idBike, 1);
  });
}
