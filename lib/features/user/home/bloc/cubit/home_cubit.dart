import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
import 'package:truee_balance_app/features/user/home/data/model/services/service_model.dart';
import 'package:truee_balance_app/features/user/home/data/model/sliders/slider_model.dart';
import 'package:truee_balance_app/features/user/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

  int currentBannerIndex = 0;

  void changeIndex(int index) {
    currentBannerIndex = index;
    emit(HomeIndexChanged());
  }

  SliderModel? sliderModel;
  AllDoctorsDataModel? doctorsModel;
  ServiceResponse? servicesModel;

  Future<void> getSliders() async {
    emit(SliderLoading());
    final result = await _homeRepo.getSliders();

    result.when(
      success: (data) {
        sliderModel = data;
        emit(SliderSuccess());
      },
      failure: (error) {
        emit(SliderFailure());
      },
    );
  }

  Future<void> getAllDoctors() async {
    emit(DoctorsLoading());
    final result = await _homeRepo.getAllDoctors(page: 1);

    result.when(
      success: (data) {
        doctorsModel = data;
        emit(DoctorsSuccess());
      },
      failure: (error) {
        emit(DoctorsFailure());
      },
    );
  }

  final ScrollController servicesScrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void setupServicesScrollController() {
    servicesScrollController.addListener(() {
      if (servicesScrollController.position.pixels >=
              servicesScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreServices();
      }
    });
  }
  Future<void> getAllServices() async {
     currentPage = 1;
    emit(ServicesLoading());
    final result = await _homeRepo.getAllServices( page: currentPage);

    result.when(
      
      success: (data) {
        servicesModel = data;
         currentPage = data.data.meta.currentPage;
        lastPage = data.data.meta.lastPage;
        emit(ServicesSuccess());
      },
      failure: (error) {
        emit(ServicesFailure());
      },
    );
  }

  /// load more services
Future<void> loadMoreServices() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(ServicesLoadingMore());

    final result = await _homeRepo.getAllServices(page: currentPage + 1);

    result.when(
      success: (data) {
        servicesModel?.data.data.addAll(data.data.data);
        currentPage = data.data.meta.currentPage;
        emit(ServicesSuccess());
      },
      failure: (error) {
        emit(ServicesFailure());
      },
    );

    isLoadingMore = false;
  }

}
