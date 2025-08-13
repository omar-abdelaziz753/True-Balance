import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:truee_balance_app/features/user/my_booking/data/repos/repos.dart';

part 'mybook__state.dart';

class MybookCubit extends Cubit<MybookState> {
  MybookCubit(this.myBookingRepos) : super(MybookInitial());

  final MyBookingRepos myBookingRepos;

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

  Future<void> getAllconsultations() async {
    currentPage = 1;
    emit(ConsultationsLoading());
    final result = await myBookingRepos.getConsultations(page: currentPage);

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

    final result = await myBookingRepos.getConsultations(page: currentPage + 1);

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
}
