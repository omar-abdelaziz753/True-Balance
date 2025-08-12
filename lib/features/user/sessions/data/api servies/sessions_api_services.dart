import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class SessionsApiServices {
  final DioHelper _dioFactory;
  SessionsApiServices(this._dioFactory);

  Future<Response?> getAllTherapist() async {
    return _dioFactory.get(endPoint: EndPoints.getTherapist);
  }
}
