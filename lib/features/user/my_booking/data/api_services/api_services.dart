import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class MyBookingApiServices {
  final DioHelper _dioHelper;

  MyBookingApiServices(this._dioHelper);

  /// get consultations
  Future<Response?> getAllConsultations({required int page}) async {
    return _dioHelper
        .get(endPoint: EndPoints.getconsultations, data: {'page': page});
  }
}
