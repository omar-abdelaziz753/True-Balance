import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/treatment_plans_response.dart';
import 'package:truee_balance_app/features/user/sessions/data/repo/sessions_repo.dart';

part 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit(this._sessionsRepo) : super(SessionsInitial());
  final SessionsRepo? _sessionsRepo;

  AllTherapistDataModel? allTherapistDataModel;

  /// Get All Therapist
  Future<void> getAllTherapist() async {
    emit(GetAllTherapistLoadingState());
    final result = await _sessionsRepo!.getAllTherapist();
    result.when(
      success: (data) {
        allTherapistDataModel = data;
        emit(GetAllTherapistSuccessState());
      },
      failure: (error) {
        print('error: ${error.toString()}');
        emit(GetAllTherapistFailureState(message: error.toString()));
      },
    );
  }

  TreatmentPlansResponse? treatmentPlansResponse;  

  /// Get By Therapist
  Future<void> getByTherapist({required int therapistId}) async {
    emit(GetByTherapistLoadingState());
    final result =
        await _sessionsRepo!.getByTherapist(therapistId: therapistId);
    result.when(
      success: (data) {
        treatmentPlansResponse = data;
        emit(GetByTherapistSuccessState());
      },
      failure: (error) {
        print('error: ${error.toString()}');
        emit(GetByTherapistFailureState(message: error.toString()));
      },
    );
  }
}
