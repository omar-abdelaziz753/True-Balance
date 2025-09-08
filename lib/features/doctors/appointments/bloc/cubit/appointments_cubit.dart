import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_state.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/repo/repos.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(this.appointmentsRepos) : super(AppointmentsInitial());

  final AppointmentsRepos appointmentsRepos;

  ConsultationUsersResponse? consultationUsersResponse;
  final ScrollController consultationsdoctorsScrollController =
      ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  final TextEditingController searchController = TextEditingController();
  void setupAllDoctorsConsultationsScrollController() {
    consultationsdoctorsScrollController.addListener(() {
      if (consultationsdoctorsScrollController.position.pixels >=
              consultationsdoctorsScrollController.position.maxScrollExtent -
                  100 &&
          !isLoadingMore) {
        loadMoreAllDoctorsConsultations();
      }
    });
  }

  bool? isPending;

  Future<void> getAllDoctorsConsultations({required bool isPending}) async {
    currentPage = 1;
    this.isPending = isPending;
    emit(AppointmentsLoading());
    final result = await appointmentsRepos.getAllDoctorsConsultations(
        page: currentPage, isPending: isPending, search: searchController.text);

    result.when(
      success: (data) {
        consultationUsersResponse = data;
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        lastPage = data.data?.meta?.lastPage ?? lastPage;
        emit(AppointmentsSuccess());
      },
      failure: (error) {
        emit(AppointmentsError());
      },
    );
  }

  /// load more AllDoctorsConsultations
  Future<void> loadMoreAllDoctorsConsultations() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(AppointmentsLoadingMore());

    final result = await appointmentsRepos.getAllDoctorsConsultations(
        page: currentPage + 1,
        isPending: isPending!,
        search: searchController.text);

    result.when(
      success: (data) {
        consultationUsersResponse?.data?.data?.addAll(data.data?.data ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(AppointmentsSuccess());
      },
      failure: (error) {
        emit(AppointmentsError());
      },
    );
    isLoadingMore = false;
  }
}
