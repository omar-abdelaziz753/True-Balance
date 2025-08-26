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
}
