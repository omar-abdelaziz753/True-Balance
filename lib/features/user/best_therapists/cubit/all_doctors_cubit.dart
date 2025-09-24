import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
import 'package:truee_balance_app/features/user/home/data/repo/home_repo.dart';

part 'all_doctors_state.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsState> {
  AllDoctorsCubit(this._homeRepo) : super(AllDoctorsInitial());

  final HomeRepo _homeRepo;

  AllDoctorsDataModel? doctorsModel;
  final ScrollController doctorsScrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void setupDoctorsScrollController() {
    doctorsScrollController.addListener(() {
      if (doctorsScrollController.position.pixels >=
              doctorsScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreDoctors();
      }
    });
  }

  String? search;
  Future<void> getAllDoctors({String? search}) async {
    currentPage = 1;
    emit(DoctorsLoading());

    final result =
        await _homeRepo.getAllDoctors(page: currentPage, search: search);
    this.search = search;

    result.when(
      success: (data) {
        doctorsModel = data;
        currentPage = data.data.meta.currentPage ?? 1;
        lastPage = data.data.meta.lastPage ?? 1;
        emit(DoctorsSuccess());
      },
      failure: (error) {
        emit(DoctorsFailure());
      },
    );
  }

  Future<void> loadMoreDoctors() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(DoctorsLoadingMore());

    final result =
        await _homeRepo.getAllDoctors(page: currentPage + 1, search: search);

    result.when(
      success: (data) {
        doctorsModel?.data.data.addAll(data.data.data);
        currentPage = data.data.meta.currentPage ?? 1;
        emit(DoctorsSuccess());
      },
      failure: (error) {
        emit(DoctorsFailure());
      },
    );

    isLoadingMore = false;
  }

  @override
  Future<void> close() {
    doctorsScrollController.dispose();
    return super.close();
  }
}
