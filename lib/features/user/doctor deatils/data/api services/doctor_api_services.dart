import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class DoctorApiServices {
  final DioHelper _dioFactory;
  DoctorApiServices(this._dioFactory);

  Future<Response?> getAllDoctors({required int doctorId}) async {
    return _dioFactory.get(endPoint: "${EndPoints.getDoctors}/$doctorId");
  }
}
