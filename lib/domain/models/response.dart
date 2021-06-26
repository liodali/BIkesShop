import 'package:bikes_shop/domain/models/bike.dart';

abstract class IResponse {}

class AppResponse<T> extends IResponse {
  T? data;
  dynamic error;

  AppResponse({
    required this.data,
    this.error,
  });
}

class BikesResponse extends AppResponse<List<Bike>> {
  BikesResponse(List<Map<String, dynamic>> json)
      : super(
          error: null,
          data: json.map((e) => Bike.fromJson(e)).toList(),
        );

  BikesResponse.error(dynamic error)
      : super(
          error: error,
          data: null,
        );
}
