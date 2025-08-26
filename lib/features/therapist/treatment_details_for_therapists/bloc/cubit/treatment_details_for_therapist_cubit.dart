import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/model/treatment_sessions_response_for_therapists.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/repo/repo.dart';

part 'treatment_details_for_therapist_state.dart';

class TreatmentDetailsForTherapistCubit
    extends Cubit<TreatmentDetailsForTherapistState> {
  TreatmentDetailsForTherapistCubit(this._treatmentDetailsForTherapistRepos)
      : super(TreatmentDetailsForTherapistStateInitial());

  final TreatmentDetailsForTherapistRepos _treatmentDetailsForTherapistRepos;
  TreatmentSessionsResponseForTherapists?
      treatmentSessionsResponseForTherapists;
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  int? doctorId;
  bool? isPending;

  Future<void> fetchTreatment({
    required int doctorId,
    required bool isPending,
  }) async {
    emit(TreatmentDetailsForTherapistStateLoading());
    this.doctorId = doctorId;
    this.isPending = isPending;
    final result =
        await _treatmentDetailsForTherapistRepos.getSessionsOfTreatmentPlans(
      page: 1,
      isPending: isPending,
      id: doctorId,
    );

    result.when(
      success: (data) {
        treatmentSessionsResponseForTherapists = data;
        currentPage = data.data?.meta?.currentPage ?? 1;
        lastPage = data.data?.meta?.lastPage ?? 1;
        emit(TreatmentDetailsForTherapistStateSuccess());
      },
      failure: (error) {
        emit(TreatmentDetailsForTherapistStateError());
      },
    );
  }

  final ScrollController traetmentforTherapistsscrollController =
      ScrollController();
  void setupTraetmentforTherapistsScrollController() {
    traetmentforTherapistsscrollController.addListener(() {
      if (traetmentforTherapistsscrollController.position.pixels >=
              traetmentforTherapistsscrollController.position.maxScrollExtent -
                  100 &&
          !isLoadingMore) {
        loadMoreTraetmentforTherapists();
      }
    });
  }

  Future<void> loadMoreTraetmentforTherapists() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(TreatmentDetailsForTherapistStateLoadingMore());

    final result =
        await _treatmentDetailsForTherapistRepos.getSessionsOfTreatmentPlans(
      page: currentPage + 1,
      isPending: isPending!,
      id: doctorId!,
    );

    result.when(
      success: (data) {
        treatmentSessionsResponseForTherapists?.data?.data
            ?.addAll(data.data?.data ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(TreatmentDetailsForTherapistStateSuccess());
      },
      failure: (error) {
        emit(TreatmentDetailsForTherapistStateError());
      },
    );

    isLoadingMore = false;
  }

  Future<void> rateSession({
    required int id,
    required File file,
    required String notes,
    required String recoveryRate,
  }) async {
    showLoading();
    emit(RateSessionLoadingState());
    final result =
        await _treatmentDetailsForTherapistRepos.rateSessionTherapist(
      id: id,
      file: file,
      notes: notes,
      recoveryRate: recoveryRate,
    );
    result.when(
      success: (data) {
        hideLoading();

        emit(RateSessionSuccessState());
      },
      failure: (error) {
        hideLoading();
        emit(RateSessionFailureState());
      },
    );
  }
}
