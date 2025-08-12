import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/treatment_plans_response.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';
import 'package:truee_balance_app/features/user/session%20details/data/repo/sessions_details_repo.dart';

part 'session_details_state.dart';

class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  SessionDetailsCubit(this._sessionsRepo) : super(SessionDetailsInitial());
  final SessionsDetailsRepo _sessionsRepo;

  TreatmentPlansResponse? treatmentPlansResponse;
  Future<void> getByTherapist({required int therapistId}) async {
    emit(GetByTherapistLoadingState());
    final result = await _sessionsRepo.getByTherapist(therapistId: therapistId);
    result.when(
      success: (data) {
        treatmentPlansResponse = data;
        emit(GetByTherapistSuccessState());
      },
      failure: (error) {
        emit(GetByTherapistFailureState());
      },
    );
  }

  TreatmentPlanDetail? treatmentPlanDetail;
  List<Session> completedSessions = [];
  List<Session> upcomingSessions = [];

  Future<void> treatmentPlansdetails({required int therapistId}) async {
    emit(GetByTherapistDetailLoadingState());
    final result =
        await _sessionsRepo.treatmentPlansdetails(therapistId: therapistId);
    result.when(
      success: (data) {
        treatmentPlanDetail = data;
        init(data);
        emit(GetByTherapistDetailSuccessState());
      },
      failure: (error) {
        emit(GetByTherapistDetailFailureState());
      },
    );
  }

  void init(TreatmentPlanDetail data) {
    completedSessions = data.sessions
        .asMap()
        .entries
        .where((entry) => entry.value.status == 'completed')
        .map((entry) {
      entry.value.index = entry.key;
      return entry.value;
    }).toList();
    upcomingSessions = data.sessions
        .asMap()
        .entries
        .where((entry) => entry.value.status != 'completed')
        .map((entry) {
      entry.value.index = entry.key;
      return entry.value;
    }).toList();
  }
}
