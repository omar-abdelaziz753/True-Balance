import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class CreateBookingApiServices {
  final DioHelper _dioFactory;
  CreateBookingApiServices(this._dioFactory);

  Future<Response?> getSlots(
      {required int doctorId, required String data}) async {
    return _dioFactory.post(
        endPoint: EndPoints.getSlots,
        data: {'date': data, 'doctor_id': doctorId});
  }

  Future<Response?> bookSession(
      {required int doctorId,
      required String data,
      required String time}) async {
    return _dioFactory.post(
        endPoint: EndPoints.bookSession,
        data: {'date': data, 'doctor_id': doctorId, "time": time});
  }


}
