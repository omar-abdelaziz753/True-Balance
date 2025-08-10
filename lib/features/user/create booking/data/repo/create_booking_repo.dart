import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/api%20servies/create_booking_api_services.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/free_slots_model.dart';

class CreateBookingRepo {
  final CreateBookingApiServices _api;

  CreateBookingRepo(this._api);

  Future<ApiResult<FreeSlotsModel>> getSlots({
    required int doctorId,
    required String date,
  }) async {
    try {
      final response = await _api.getSlots(doctorId: doctorId, data: date);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = FreeSlotsModel.fromJson(response!.data);
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

  Future<ApiResult<dynamic>> bookSession({
    required int doctorId,
    required String date,
    required String time,
  }) async {
    try {
      final response = await _api.bookSession(
        doctorId: doctorId,
        data: date,
        time: time,
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response?.data);
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

  /// Get All Therapist
  Future<ApiResult<AllTherapistDataModel>> getAllTherapist() async {
    try {
      final response = await _api.getAllTherapist();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = AllTherapistDataModel.fromJson(response!.data);
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
}
