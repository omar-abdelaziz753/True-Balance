
import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class ReportsApiServices {

  final DioHelper _dioFactory;

  ReportsApiServices(this._dioFactory);

  Future<Response?> getReports() async {
    return _dioFactory.get(endPoint: EndPoints.getReports);
  }
}