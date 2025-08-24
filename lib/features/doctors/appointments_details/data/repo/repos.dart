import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/api%20services/api_services.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/model/appointment_details_model.dart';

class AppointmentsDetailsRepos {
  final AppointmentsDetailsApiServices appointmentsApiServices;

  AppointmentsDetailsRepos(this.appointmentsApiServices);
  Future<ApiResult<AppointmentDetailsModel>> getAllConsultation(
      {required int page, required bool isPending, required int id}) async {
    try {
      final response = await appointmentsApiServices.getAllConsultation(
          page: page, isPending: isPending, id: id);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = AppointmentDetailsModel.fromJson(response!.data);
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
