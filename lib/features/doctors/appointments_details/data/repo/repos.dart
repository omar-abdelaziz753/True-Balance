import 'dart:io';

import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
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

  Future<ApiResult<String>> consultationAccess({
    required int consultationId,
    required String doctorEvaluation,
    required File? file,
  }) async {
    try {
      final response = await appointmentsApiServices.consultationAccess(
        consultationId: consultationId,
        doctorEvaluation: doctorEvaluation,
        file: file,
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        customToast(
            msg: "Consultation marked as completed successfully. ",
            color: AppColors.greenColor100);
        return const ApiResult.success(
            "Consultation marked as completed successfully.");
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
