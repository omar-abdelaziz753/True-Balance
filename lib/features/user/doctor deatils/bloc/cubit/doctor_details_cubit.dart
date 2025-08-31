import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_reviews_models.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/repo/doctor_repo.dart';

part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit(this._doctorRepo) : super(DoctorDetailsInitial());

  final DoctorRepo _doctorRepo;

  DoctorDetailsResponse? doctorDetails;
  int? doctorId;
  Future<void> fetchDoctorDetails({required int doctorId}) async {
    emit(DoctorDetailsLoading());
    this.doctorId = doctorId;
    final result = await _doctorRepo.getAllDoctors(doctorId: doctorId);

    result.when(
      success: (data) {
        doctorDetails = data;
        emit(DoctorDetailsSuccess());
      },
      failure: (error) {
        emit(DoctorDetailsFailure());
      },
    );
  }

  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void setupAllDoctorsReviewsScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreAllDoctorsReviews();
      }
    });
  }

  ReviewsResponse? doctorReviews;
  Future<void> getDoctorReviews({required int doctorId}) async {
    emit(DoctorReviewsLoading());

    final result =
        await _doctorRepo.getDoctorReviews(doctorId: doctorId, page: 1);

    result.when(
      success: (data) {
        doctorReviews = data;
        emit(DoctorReviewsSuccess());
      },
      failure: (error) {
        emit(DoctorReviewsFailure());
      },
    );
  }

  Future<void> loadMoreAllDoctorsReviews() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(DoctorReviewsLoadingMore());

    final result = await _doctorRepo.getDoctorReviews(
      doctorId: doctorId!,
      page: currentPage + 1,
    );

    result.when(
      success: (data) {
        doctorReviews?.data!.reviews!.addAll(data.data?.reviews ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(DoctorReviewsSuccess());
      },
      failure: (error) {
        emit(DoctorReviewsFailure());
      },
    );
    isLoadingMore = false;
  }
}
