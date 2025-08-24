import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/model/appointment_details_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/repo/repos.dart';

part 'appointments_details_state.dart';

class AppointmentsDetailsCubit extends Cubit<AppointmentsDetailsState> {
  AppointmentsDetailsCubit(this.appointmentsDetailsRepo)
      : super(AppointmentsDetailsInitial());

  final AppointmentsDetailsRepos appointmentsDetailsRepo;

  AppointmentDetailsModel? appointmentDetailsModel;

  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  int? doctorId;
  bool? isPending;

  Future<void> fetchAppointments({
    required int doctorId,
    required bool isPending,
  }) async {
    emit(AppointmentsDetailsLoading());
    this.doctorId = doctorId;
    this.isPending = isPending;
    final result = await appointmentsDetailsRepo.getAllConsultation(
      page: 1,
      isPending: isPending,
      id: doctorId,
    );

    result.when(
      success: (data) {
        appointmentDetailsModel = data;
        currentPage = data.data?.meta?.currentPage ?? 1;
        lastPage = data.data?.meta?.lastPage ?? 1;
        emit(AppointmentsDetailsSuccess());
      },
      failure: (error) {
        emit(AppointmentsDetailsError());
      },
    );
  }

  final ScrollController scrollController = ScrollController();
  void setupAllDoctorsConsultationsScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreAppointments();
      }
    });
  }

  Future<void> loadMoreAppointments() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(AppointmentsDetailsLoadingMore());

    final result = await appointmentsDetailsRepo.getAllConsultation(
      page: currentPage + 1,
      isPending: isPending!,
      id: doctorId!,
    );

    result.when(
      success: (data) {
        appointmentDetailsModel?.data?.data?.addAll(data.data?.data ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(AppointmentsDetailsSuccess());
      },
      failure: (error) {
        emit(AppointmentsDetailsError());
      },
    );

    isLoadingMore = false;
  }

  // Future<void> completeConsultation({
  //   required int consultationId,
  //   required String doctorEvaluation,
  //   required File file,
  // }) async {
  //   showLoading();
  //   emit(AppointmentsDetailsSubmitting());

  //   final result = await appointmentsDetailsRepo.consultationAccess(
  //     consultationId: consultationId,
  //     doctorEvaluation: doctorEvaluation,
  //     file: file,
  //   );

  //   result.when(
  //     success: (message) {
  //       hideLoading();
  //       emit(AppointmentsDetailsSubmittedSuccessfully());
  //     },
  //     failure: (error) {
  //       hideLoading();

  //       emit(AppointmentsDetailsSubmissionError());
  //     },
  //   );
  // }

  Future<bool> completeConsultation({
    required int consultationId,
    required String doctorEvaluation,
    required File file,
  }) async {
    emit(AppointmentsDetailsSubmitting());
    showLoading();
    final result = await appointmentsDetailsRepo.consultationAccess(
      consultationId: consultationId,
      doctorEvaluation: doctorEvaluation,
      file: file,
    );

    bool success = false;

    result.when(
      success: (message) {
        hideLoading();
        emit(AppointmentsDetailsSubmittedSuccessfully());
        success = true;
      },
      failure: (error) {
        hideLoading();

        emit(AppointmentsDetailsSubmissionError());
        success = false;
      },
    );

    return success;
  }

  void removeAppointmentAt(int index) {
    final list = appointmentDetailsModel!.data!.data!;
    list.removeAt(index);
    emit(AppointmentsDetailsUpdated()); // emit new state to refresh UI
  }
}
