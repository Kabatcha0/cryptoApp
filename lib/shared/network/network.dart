import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://api.coingecko.com/api/v3/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String path, required Map<String, dynamic> json}) async {
    return await dio.get(
      path,
      queryParameters: json,
    );
  }
}
