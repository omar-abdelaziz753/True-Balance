import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/home/data/apiServices/home_api_services.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
import 'package:truee_balance_app/features/user/home/data/model/services/service_model.dart';
import 'package:truee_balance_app/features/user/home/data/model/sliders/slider_model.dart';

class HomeRepo {
  final HomeApiServices api;

  HomeRepo(this.api);

  Future<ApiResult<SliderModel>> getSliders() async {
    try {
      final response = await api.getSliders();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = SliderModel.fromJson(response!.data);
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

  Future<ApiResult<AllDoctorsDataModel>> getAllDoctors(
      {required int page}) async {
    try {
      final response = await api.getAllDoctors(page: page);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = AllDoctorsDataModel.fromJson(response!.data);
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

  Future<ApiResult<ServiceResponse>> getAllServices({required int page}) async {
    try {
      final response = await api.getAllServices(page: page);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = ServiceResponse.fromJson(response!.data);
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
