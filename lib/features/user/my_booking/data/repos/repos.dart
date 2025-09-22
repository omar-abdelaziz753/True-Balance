import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/my_booking/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';

class MyBookingRepos {
  final MyBookingApiServices myBookingApiServices;

  MyBookingRepos(this.myBookingApiServices);

  /// Get Consultations
  Future<ApiResult<ConsultationsResponse>> getConsultations(
      {required int page, required bool isPending}) async {
    try {
      final response = await myBookingApiServices.getAllConsultations(
          page: page, isPending: isPending);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = ConsultationsResponse.fromJson(response!.data);
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
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Delete Consultations
  Future<ApiResult<String>> deleteConsultation(
      {required int consultationId}) async {
    try {
      final response = await myBookingApiServices.deleteConsultation(
        id: consultationId,
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final message = response?.data['message'] ?? 'Rate added successfully';
        return ApiResult.success(message);
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
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  Future<ApiResult<String>> addRateConsultation({
    required int consultationId,
    required int userRate,
    required String userMessage,
  }) async {
    try {
      final response = await myBookingApiServices.addRateCosultation(
        consultationId: consultationId,
        userRate: userRate,
        userMessage: userMessage,
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final message = response?.data['message'] ?? 'Rate added successfully';
        return ApiResult.success(message);
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
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }
}
