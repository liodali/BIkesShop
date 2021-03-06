import 'package:dio/dio.dart';

abstract class BaseRepository {
  late Dio _dio = Dio();

  final String server = "https://bikesstoreapi.herokuapp.com/";

  Future<Response<Map<String, dynamic>>> get({
    required String endpoint,
    Map<String, dynamic>? query,
    CancelToken? token,
    Options? options,
  }) {
    return _dio.get(
      "$server$endpoint",
      queryParameters: query,
      cancelToken: token,
      options: options,
    );
  }

  Future<Response<Map<String, dynamic>>> post(
    String url,
    Map<String, dynamic> body,
    Map<String, dynamic> query,
    CancelToken token,
    Options? options,
  ) {
    return _dio.post(
      url,
      data: body,
      queryParameters: query,
      cancelToken: token,
      options: options,
    );
  }
}
