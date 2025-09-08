import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class AppointmentsApiServices {
  final DioHelper _dioHelper;

  AppointmentsApiServices(this._dioHelper);

  /// get consultations doctors
  Future<Response?> getAllDoctorsConsultations(
      {required int page,
      required bool isPending,
      required String search}) async {
    return _dioHelper.get(
        endPoint: EndPoints.getAllDoctorsConsultations,
        data: {
          'page': page,
          "search": search,
          "status": isPending ? 'pending' : 'completed'
        }..removeWhere((key, value) => value.toString().isEmpty));
  }
}
