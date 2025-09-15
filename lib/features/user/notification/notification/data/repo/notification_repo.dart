import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/api%20services/api_services_notification.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';

class NotificationRepo {
  final ApiServicesNotification apiServicesNotification;

  NotificationRepo(this.apiServicesNotification);

  Future<ApiResult<NotificationsResponse>> getNotification(int page) async {
    try {
      final response = await apiServicesNotification.getNotification(page);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = NotificationsResponse.fromJson(response!.data);
        return ApiResult.success(model);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
        FailureException(errMessage: 'Unexpected error occurred'));
  }

  /// Delete All Notifications
  Future<ApiResult<String>> deleteAllNotifications() async {
    try {
      final response = await apiServicesNotification.deleteAllNotifications();
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response!.data['message']);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
        FailureException(errMessage: 'Unexpected error occurred'));
  }
}
