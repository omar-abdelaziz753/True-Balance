import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/details_for_therapists/data/model/treatment_plans_response_user_for_therapists.dart';
import 'package:truee_balance_app/features/details_for_therapists/data/repo/repo.dart';

part 'details_for_therapists_state.dart';
class DetailsForTherapistsCubit extends Cubit<DetailsForTherapistsState> {
  DetailsForTherapistsCubit(this.detailsForTherapistsRepo)
      : super(DetailsForTherapistsInitial());

  final DetailsForTherapistsRepo detailsForTherapistsRepo;

  TreatmentPlansResponseUserForTherapists?
      treatmentPlansResponseUserForTherapists;

  final ScrollController getSUserTreatmentplansController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;
  int? userId;

  void setupgetusertreatmentPlansfortherapistScrollController() {
    getSUserTreatmentplansController.addListener(() {
      if (getSUserTreatmentplansController.position.pixels >=
              getSUserTreatmentplansController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreGetUsertreatmentplans();
      }
    });
  }

  Future<void> getusertreatmentPlansfortherapist({required int id}) async {
    currentPage = 1;
    userId = id; 
    emit(GetSUserTreatmentplansLoadingState());

    final result = await detailsForTherapistsRepo
        .getusertreatmentPlansfortherapist(page: currentPage, userId: id);

    result.when(
      success: (data) {
        treatmentPlansResponseUserForTherapists = data;
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        lastPage = data.data?.meta?.lastPage ?? lastPage;
        emit(GetSUserTreatmentplansSuccessState());
      },
      failure: (error) {
        emit(GetSUserTreatmentplansErrorState());
      },
    );
  }

  /// load more treatment plans
  Future<void> loadMoreGetUsertreatmentplans() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(GetSUserTreatmentplansLoadingMore());

    final result =
        await detailsForTherapistsRepo.getusertreatmentPlansfortherapist(
            page: currentPage + 1, userId: userId!);

    result.when(
      success: (data) {
        treatmentPlansResponseUserForTherapists?.data?.data
            ?.addAll(data.data?.data ?? []); 
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(GetSUserTreatmentplansSuccessState());
      },
      failure: (error) {
        emit(GetSUserTreatmentplansErrorState());
      },
    );
    isLoadingMore = false;
  }
}
