import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:truee_balance_app/features/user/my_booking/data/repos/repos.dart';

part 'mybook__state.dart';

class MybookCubit extends Cubit<MybookState> {
  MybookCubit(this.myBookingRepos) : super(MybookInitial());

  final MyBookingRepos myBookingRepos;
  bool hasRated = false;

  ConsultationsResponse? consultationsResponse;
  final ScrollController consultationsScrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void setupConsultationsScrollController() {
    consultationsScrollController.addListener(() {
      if (consultationsScrollController.position.pixels >=
              consultationsScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreConsultations();
      }
    });
  }

  bool? isPending;
  Future<void> getAllconsultations({required bool isPending}) async {
    currentPage = 1;
    this.isPending = isPending;
    emit(ConsultationsLoading());
    final result = await myBookingRepos.getConsultations(
        page: currentPage, isPending: isPending);

    result.when(
      success: (data) {
        consultationsResponse = data;
        currentPage = data.data.meta.currentPage!;
        lastPage = data.data.meta.lastPage!;
        emit(ConsultationsSuccess());
      },
      failure: (error) {
        emit(ConsultationsError());
      },
    );
  }

  /// load more consultations
  Future<void> loadMoreConsultations() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(ConsultationsLoadingMore());

    final result = await myBookingRepos.getConsultations(
        page: currentPage + 1, isPending: isPending!);

    result.when(
      success: (data) {
        consultationsResponse?.data.data.addAll(data.data.data);
        currentPage = data.data.meta.currentPage!;
        emit(ConsultationsSuccess());
      },
      failure: (error) {
        emit(ConsultationsError());
      },
    );
    isLoadingMore = false;
  }

  Future<void> addRateConsultation({
    required int consultationId,
    required int userRate,
    required String userMessage,
  }) async {
    emit(AddRateLoading());
    showLoading();
    final result = await myBookingRepos.addRateConsultation(
      consultationId: consultationId,
      userRate: userRate,
      userMessage: userMessage,
    );

    result.when(
        success: (message) => {
              hasRated = true,
              hideLoading(),
              emit(AddRateSuccess()),
            },
        failure: (error) => {
              hideLoading(),
              emit(AddRateFailure()),
            });
  }

  void updateHasRated(bool value) {
    hasRated = value;
    emit(MybookInitial()); // or any state to refresh UI
  }
}
