import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:true_balance_app/core/cache_helper/cache_helper.dart';
import 'package:true_balance_app/core/cache_helper/cache_keys.dart';
import 'package:true_balance_app/core/networks_helper/dio_helper/end_points.dart';

class DioHelper {
  static Dio dio = Dio();

  static Future<void> init() {
    assert(
      !kReleaseMode ||
          Uri.tryParse(EndPoints.baseUrl)?.scheme == 'https',
      'API_BASE_URL must be https in release',
    );
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
      // Contract: responses never throw on HTTP error statuses;
      // every caller must branch on response statusCode.
      validateStatus: (status) => true,
    );

    dio = Dio(baseOptions);
    if (kDebugMode) {
      addDioInterceptor();
    }
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

    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.get(
      endPoint,
      queryParameters: data,
      options: Options(headers: headers),
    );
  }

  Future<Response?> post(
      {required String endPoint, data, Options? options}) async {
    String? token = await _getAuthorizationToken();

    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    final Map<String, dynamic> mergedHeaders = {
      ...headers,
      ...?options?.headers,
    };
    final Options effectiveOptions =
        (options ?? Options()).copyWith(headers: mergedHeaders);
    return await dio.post(endPoint, data: data, options: effectiveOptions);
  }

  Future<Response?> put({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.put(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response?> patch({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.patch(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response?> delete({required String endPoint, data}) async {
    String? token = await _getAuthorizationToken();

    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "lang": CacheHelper.getCurrentLanguage().toString(),
      "authorization": "Bearer $token",
    };
    return await dio.delete(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
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
