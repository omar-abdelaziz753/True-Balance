import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
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
  // ServicesModel? servicesModel;

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

  // Future<void> getAllServices() async {
  //   emit(ServicesLoading());
  //   final result = await _homeRepo.getAllServices();

  //   result.when(
  //     success: (data) {
  //       servicesModel = data;
  //       emit(ServicesSuccess());
  //     },
  //     failure: (error) {
  //       emit(ServicesFailure());
  //     },
  //   );
  // }

}
