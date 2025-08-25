import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class DetailsForTherapistsApiServices {
  final DioHelper _dioHelper;

  DetailsForTherapistsApiServices(this._dioHelper);

  /// get user treatment plans
  Future<Response?> getusertreatmentPlansfortherapist(
      {required int id, required int page}) async {
    return _dioHelper
        .get(endPoint: EndPoints.getusertreatmentPlansfortherapist(id), data: {
      'page': page,
    });
  }
}
