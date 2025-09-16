import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/api%20services/api_services.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';

class AppointmentsRepos {
  final AppointmentsApiServices appointmentsApiServices;

  AppointmentsRepos(this.appointmentsApiServices);

  /// getAllDoctorsConsultations
  Future<ApiResult<ConsultationUsersResponse>> getAllDoctorsConsultations(
      {required int page,
      required bool isPending,
      required String search}) async {
    try {
      final response = await appointmentsApiServices.getAllDoctorsConsultations(
          page: page, isPending: isPending, search: search);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = ConsultationUsersResponse.fromJson(response!.data);
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
