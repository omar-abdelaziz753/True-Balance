import 'dart:io';

import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class TreatmentDetailsForTherapistsApiServices {
  final DioHelper _dioHelper;

  TreatmentDetailsForTherapistsApiServices(this._dioHelper);

  /// get Sessions Of Treatment Plans for therapist
  Future<Response?> getSessionsOfTreatmentPlans(
      {required int page, required bool isPending, required int id}) async {
    return _dioHelper.get(
        endPoint: EndPoints.getSessionsOfTreatmentPlans(isPending, id),
        data: {'page': page});
  }

//    Future<Response?> getSessionsOfTreatmentPlans(
//       {required int id}) async {
//     return _dioHelper.get(
//         endPoint: EndPoints.rateSessionTherapist( id),
//         data:   'files': [
//     await MultipartFile.fromFile('postman-cloud:///1f030bff-c419-4a90-9998-6486c1ae20de', filename: '')
//   ],
//   'notes': 'Hello Goooo',
//   'recovery_rate': '23'
// })):
//   }
  Future<Response?> rateSessionTherapist({
    required int id,
    required File file,
    required String notes,
    required String recoveryRate,
  }) async {
    final formData = FormData.fromMap({
      'file': [
        await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      ],
      'notes': notes,
      'recovery_rate': recoveryRate,
    });

    return _dioHelper.post(
      endPoint: EndPoints.rateSessionTherapist(id),
      data: formData,
    );
  }
}
