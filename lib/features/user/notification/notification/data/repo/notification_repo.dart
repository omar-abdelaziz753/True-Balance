import 'package:dio/dio.dart';
import 'package:true_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:true_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:true_balance_app/core/networks_helper/errors/failure.dart';
import 'package:true_balance_app/features/user/notification/notification/data/api%20services/api_services_notification.dart';
import 'package:true_balance_app/features/user/notification/notification/data/model/notifications_response.dart';

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
        return ApiResult.success(response!.data['status']);
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

  /// Make As Read
  Future<ApiResult<String>> makeAsRead() async {
    try {
      final response = await apiServicesNotification.makeAsRead();
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response!.data['status']);
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

  /// Mark Single Notification As Read
  Future<ApiResult<String>> markAsRead(int id) async {
    try {
      final response = await apiServicesNotification.markAsRead(id);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response!.data['status']);
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

  /// Delete Single Notification
  Future<ApiResult<String>> deleteNotification(int id) async {
    try {
      final response = await apiServicesNotification.deleteNotification(id);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response!.data['status']);
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
