// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';
// import 'package:truee_balance_app/features/user/sessions/data/repo/sessions_repo.dart';

// part 'sessions_state.dart';

// class SessionsCubit extends Cubit<SessionsState> {
//   SessionsCubit(this._sessionsRepo) : super(SessionsInitial());
//   final SessionsRepo? _sessionsRepo;

//   AllTherapistDataModel? allTherapistDataModel;

//   /// Get All Therapist
//   Future<void> getAllTherapist() async {
//     emit(GetAllTherapistLoadingState());
//     final result = await _sessionsRepo!.getAllTherapist();
//     result.when(
//       success: (data) {
//         allTherapistDataModel = data;
//         emit(GetAllTherapistSuccessState());
//       },
//       failure: (error) {
//         emit(GetAllTherapistFailureState(message: error.toString()));
//       },
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/create booking/data/model/all_therapist_data_model.dart';
import 'package:truee_balance_app/features/user/sessions/data/repo/sessions_repo.dart';

part 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit(this._sessionsRepo) : super(SessionsInitial());

  final SessionsRepo _sessionsRepo;

  AllTherapistDataModel? allTherapistDataModel;
  final ScrollController therapistScrollController = ScrollController();

  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  String? name;

  void setupTherapistScrollController() {
    therapistScrollController.addListener(() {
      if (therapistScrollController.position.pixels >=
              therapistScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreTherapists();
      }
    });
  }

  /// Get All Therapist (first page)
  Future<void> getAllTherapist({
    String? specialization,
    String? name,
  }) async {
    currentPage = 1;
    this.name = name;

    emit(GetAllTherapistLoadingState());
    final result = await _sessionsRepo.getAllTherapist(
      page: currentPage,
      name: name,
    );

    result.when(
      success: (data) {
        allTherapistDataModel = data;
        currentPage = data.data?.meta?.currentPage ?? 1;
        lastPage = data.data?.meta?.lastPage ?? 1;
        emit(GetAllTherapistSuccessState());
      },
      failure: (error) {
        emit(GetAllTherapistFailureState(message: error.toString()));
      },
    );
  }

  /// Load more therapists
  Future<void> loadMoreTherapists() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(GetAllTherapistLoadingMoreState());

    final result = await _sessionsRepo.getAllTherapist(
      name: name,
      page: currentPage + 1,
    );

    result.when(
      success: (data) {
        allTherapistDataModel?.data?.data?.addAll(data.data?.data ?? []);
        currentPage = data.data?.meta?.currentPage ?? currentPage;
        emit(GetAllTherapistSuccessState());
      },
      failure: (error) {
        emit(GetAllTherapistFailureState(message: error.toString()));
      },
    );

    isLoadingMore = false;
  }
}
