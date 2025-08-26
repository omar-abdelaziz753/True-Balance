import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/data/api%20services/api_services.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/data/model/treatment_plans_response_user_for_therapists.dart';

class DetailsForTherapistsRepo {
  final DetailsForTherapistsApiServices _api;

  DetailsForTherapistsRepo(this._api);

  Future<ApiResult<TreatmentPlansResponseUserForTherapists>>
      getusertreatmentPlansfortherapist({required int userId , required int page , required bool isPending}) async {
    try {
      final response = await _api.getusertreatmentPlansfortherapist(id: userId ,page: page,  isPending:  isPending);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model =
            TreatmentPlansResponseUserForTherapists.fromJson(response!.data);
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
