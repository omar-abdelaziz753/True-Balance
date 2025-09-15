import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class ApiServicesNotification {
  final DioHelper _dioFactory;

  ApiServicesNotification(this._dioFactory);

  /// get notification
  Future<Response?> getNotification(int page) async {
    return _dioFactory.get(endPoint: '${EndPoints.getOrDeleteNotifications}?page=$page');
  }

  /// Delete All Notifications
  Future<Response?> deleteAllNotifications() async {
    return _dioFactory.delete(endPoint: EndPoints.getOrDeleteNotifications);
  }
}
