import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/api%20services/doctor_api_services.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_reviews_models.dart';

class DoctorRepo {
  final DoctorApiServices api;

  DoctorRepo(this.api);

  Future<ApiResult<DoctorDetailsResponse>> getAllDoctors(
      {required int doctorId}) async {
    try {
      final response = await api.getAllDoctors(doctorId: doctorId);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = DoctorDetailsResponse.fromJson(response!.data);
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


  Future<ApiResult<ReviewsResponse>> getDoctorReviews(
      {required int doctorId , required int page}) async {
    try {
      final response = await api.getDoctorReviews(doctorId: doctorId, page:page );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = ReviewsResponse.fromJson(response!.data);
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
