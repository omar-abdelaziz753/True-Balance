import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/api%20services/api_services.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/model/treatment_sessions_response_for_therapists.dart';

class TreatmentDetailsForTherapistRepos {
  final TreatmentDetailsForTherapistsApiServices
      treatmentDetailsForTherapistsApiServices;

  TreatmentDetailsForTherapistRepos(
      this.treatmentDetailsForTherapistsApiServices);
  Future<ApiResult<TreatmentSessionsResponseForTherapists>>
      getSessionsOfTreatmentPlans(
          {required int page, required bool isPending, required int id}) async {
    try {
      final response = await treatmentDetailsForTherapistsApiServices
          .getSessionsOfTreatmentPlans(
              page: page, isPending: isPending, id: id);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model =
            TreatmentSessionsResponseForTherapists.fromJson(response!.data);
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

  rateSession({required int id, required double number, required String text}) {
    
  }
}
