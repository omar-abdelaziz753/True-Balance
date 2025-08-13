import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/user/medical_reports/data/api%20services/reports_api_services.dart';
import 'package:truee_balance_app/features/user/medical_reports/data/model/reports_model.dart';

class ReportsRepo {

  final ReportsApiServices reportsApiServices;

  ReportsRepo( this.reportsApiServices);

    /// getReports
   Future<ApiResult<ReportsModel>> getReports(
      ) async {
    try {
      final response = await reportsApiServices.getReports();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = ReportsModel.fromJson(response!.data);
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
