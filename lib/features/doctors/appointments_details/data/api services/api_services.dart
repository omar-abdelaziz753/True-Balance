import 'dart:io';

import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class AppointmentsDetailsApiServices {
  final DioHelper _dioHelper;

  AppointmentsDetailsApiServices(this._dioHelper);

  /// get consultations doctors
  Future<Response?> getAllConsultation(
      {required int page, required bool isPending, required int id}) async {
    return _dioHelper.get(
        endPoint: EndPoints.getAllConsultation(isPending, id),
        data: {'page': page});
  }



Future<Response?> consultationAccess({
  required int consultationId,
  required String doctorEvaluation,
  required File file,
}) async {
  String fileName = file.path.split('/').last;

  FormData formData = FormData.fromMap({
    "consultation_id": consultationId,
    "doctor_evaluation": doctorEvaluation,
    "file": await MultipartFile.fromFile(
      file.path,
      filename: fileName,
    ),
  });

  return _dioHelper.post(
    endPoint: EndPoints.consultationAccess,
    data: formData,
  );
}

}
