import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class MyBookingApiServices {
  final DioHelper _dioHelper;

  MyBookingApiServices(this._dioHelper);

  /// get consultations
  Future<Response?> getAllConsultations({
    required int page,
    required bool isPending,
    String? fromDate,
    String? toDate,
    String? doctorName,
  }) async {
    return _dioHelper.get(
        endPoint: EndPoints.getconsultations,
        data: {
          'page': page,
          "status": isPending ? 'pending' : 'completed',
          "doctor_name": doctorName,
          "to_date": toDate,
          "from_date": fromDate
        }..removeWhere((key, value) => value == null || value == ''));
  }

  /// Delete Consultation
  Future<Response?> deleteConsultation({required int id}) async {
    return _dioHelper.post(
        endPoint: EndPoints.deleteConsultation, data: {"consultation_id": id});
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
