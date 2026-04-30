import 'package:dio/dio.dart';
import 'package:true_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:true_balance_app/core/networks_helper/dio_helper/end_points.dart';

class ApiServicesNotification {
  final DioHelper _dioFactory;

  ApiServicesNotification(this._dioFactory);

  /// get notification
  Future<Response?> getNotification(int page) async {
    return _dioFactory.get(
        endPoint: '${EndPoints.getOrDeleteNotifications}?page=$page');
  }

  /// Delete All Notifications
  Future<Response?> deleteAllNotifications() async {
    return _dioFactory.delete(endPoint: EndPoints.getOrDeleteNotifications);
  }

  /// Make As Read
  Future<Response?> makeAsRead() async {
    return _dioFactory.post(endPoint: EndPoints.makeAsRead);
  }

  /// Mark Single Notification As Read
  Future<Response?> markAsRead(int id) async {
    return _dioFactory.post(endPoint: EndPoints.markAsRead(id));
  }

  /// Delete Single Notification
  Future<Response?> deleteNotification(int id) async {
    return _dioFactory.delete(endPoint: EndPoints.deleteNotification(id));
  }
}
