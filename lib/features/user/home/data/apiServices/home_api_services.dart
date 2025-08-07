import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class HomeApiServices {
  final DioHelper _dioFactory;
  HomeApiServices(this._dioFactory);
  Future<Response?> getSliders() async {
    return _dioFactory.get(endPoint: EndPoints.getSliders);
  }

  Future<Response?> getAllDoctors({required int page}) async {
    return _dioFactory
        .get(endPoint: EndPoints.getDoctors, data: {'page': page});
  }

  Future<Response?> getAllServices() async {
    return _dioFactory.get(endPoint: EndPoints.getServies);
  }
}
