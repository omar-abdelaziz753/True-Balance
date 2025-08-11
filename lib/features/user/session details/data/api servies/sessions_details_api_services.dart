import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class SessionsDetailsApiServices {
  final DioHelper _dioFactory;
  SessionsDetailsApiServices(this._dioFactory);

  Future<Response?> getByTherapist({required int therapistId}) async {
    return _dioFactory.get(endPoint: EndPoints.treatmentPlans(therapistId));
  }

  Future<Response?> treatmentPlansdetails({required int id}) async {
    return _dioFactory.get(endPoint: EndPoints.treatmentPlansdetails(id));
  }

  Future<Response?> addSession({required int id, required date}) async {
    return _dioFactory.post(endPoint: EndPoints.addSession(id), data: date);
  }
}
