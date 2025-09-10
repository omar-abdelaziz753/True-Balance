import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class MyBookingApiServices {
  final DioHelper _dioHelper;

  MyBookingApiServices(this._dioHelper);

  /// get consultations
  Future<Response?> getAllConsultations({required int page , required bool isPending}) async {
    return _dioHelper
        .get(endPoint: EndPoints.getconsultations, data: {'page': page , "status" : isPending ? 'pending' : 'completed'});
  }

Future<Response?> addRateCosultation({
  required int consultationId,
  required int userRate,
  required String userMessage,
}) async {
  return _dioHelper.post(
    endPoint: EndPoints.addRateCosultation,
    data: {
      "consultation_id": consultationId,
      "user_rate": userRate,
      "user_message": userMessage,
    },
  );
}

}
