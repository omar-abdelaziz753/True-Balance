import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/treatment_plans_response.dart';
import 'package:truee_balance_app/features/user/session%20details/data/api%20servies/sessions_details_api_services.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';

class SessionsDetailsRepo {
  final SessionsDetailsApiServices _api;

  SessionsDetailsRepo(this._api);

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

  Future<ApiResult<TreatmentPlanDetail>> treatmentPlansdetails(
      {required int therapistId}) async {
    try {
      final response = await _api.treatmentPlansdetails(id: therapistId);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = TreatmentPlanDetail.fromJson(response!.data["data"]);
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

  Future<ApiResult<List<Session>>> addSession(
      {required int id, required data}) async {
    try {
      final response = await _api.addSession(id: id, date: data);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return ApiResult.success((response.data["data"]['sessions'] as List)
            .map((e) => Session.fromJson(e))
            .toList());
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
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

  Future<ApiResult<String>> rateSession(
      {required int id, required double number, required String text}) async {
    try {
      final response =
          await _api.rateSession(id: id, number: number, text: text);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return ApiResult.success(response.data['message'] ?? "");
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
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
