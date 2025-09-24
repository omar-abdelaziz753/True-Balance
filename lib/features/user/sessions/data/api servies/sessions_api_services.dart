import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class SessionsApiServices {
  final DioHelper _dioFactory;
  SessionsApiServices(this._dioFactory);

  Future<Response?> getAllTherapist({
    required int page,
    String? name,
  }) async {
    return _dioFactory.get(
        endPoint: EndPoints.getTherapist,
        data: {
          // "per_page": 10,
          "page": 1,
          "search": name,
        }..removeWhere((key, value) => value == null || value == ''));
  }
}
