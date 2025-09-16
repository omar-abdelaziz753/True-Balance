import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class DioHelper {
  static Dio dio = Dio();

  static Future<void> init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    );

    dio = Dio(baseOptions);
    addDioInterceptor();
    return Future.value();
  }

  Future<String?> _getAuthorizationToken() async {
    return await CacheHelper.getSecuredString(key: CacheKeys.userToken);
  }

  Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    String? token = await _getAuthorizationToken();

    dio.options.headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.get(endPoint, queryParameters: data);
  }

  Future<Response?> post(
      {required String endPoint, data, Options? options}) async {
    String? token = await _getAuthorizationToken();

    dio.options.headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.post(endPoint, data: data, options: options);
  }

  Future<Response?> put({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    dio.options.headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getData(key: 'selectedLanguage'),
      "authorization": token,
    };
    return await dio.put(endPoint, data: data);
  }

  Future<Response?> patch({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    dio.options.headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.patch(endPoint, data: data);
  }

  Future<Response?> delete({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    dio.options.headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.delete(endPoint, data: data);
  }

  static void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
