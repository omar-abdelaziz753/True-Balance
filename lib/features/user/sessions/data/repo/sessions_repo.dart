import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/treatment_plans_response.dart';
import 'package:truee_balance_app/features/user/sessions/data/api%20servies/sessions_api_services.dart';

class SessionsRepo {
  final SessionsApiServices _api;

  SessionsRepo(this._api);

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

  /// get by therapist
  Future<ApiResult<TreatmentPlansResponse>> getByTherapist(
      {required int therapistId}) async {
    try {
      final response = await _api.getByTherapist(therapistId: therapistId);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = TreatmentPlansResponse.fromJson(response!.data);
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
