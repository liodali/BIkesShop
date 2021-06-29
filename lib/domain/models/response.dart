import 'package:bikes_shop/app/ui/pages/detail_bike.dart';
import 'package:bikes_shop/domain/models/bike.dart';

abstract class IResponse {}

class ErrorResponse extends IResponse {
  dynamic error;

  ErrorResponse({
    required this.error,
  });
}

class AppResponse<T> extends IResponse {
  T? data;

  AppResponse({
    required this.data,
  });
}

class BikesResponse extends AppResponse<List<Bike>> {
  BikesResponse(List json)
      : super(
          data: json
              .map((e) => Bike.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
}

class DetailBikeResponse extends AppResponse<BikeDetail> {
  DetailBikeResponse(Map json)
      : super(
          data: BikeDetail.fromJson(json as Map<String, dynamic>),
        );
}
