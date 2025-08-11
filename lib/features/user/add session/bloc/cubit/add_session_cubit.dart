import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';
import 'package:truee_balance_app/features/user/session%20details/data/repo/sessions_details_repo.dart';

part 'add_session_state.dart';

class AddSessionCubit extends Cubit<AddSessionState> {
  AddSessionCubit(this._sessionsRepo, this.treatmentPlanDetail)
      : super(AddSessionInitial());

  final SessionsDetailsRepo _sessionsRepo;
  final TreatmentPlanDetail treatmentPlanDetail;

  int currentStep = 0;

  void nextStep() {
    currentStep++;
    emit(ChangeStepState());
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(ChangeStepState());
    }
  }

  List<SelecteItem> selectedItems = [];

  void addSelectedItem(SelecteItem item) {
    selectedItems.add(item);
    emit(ChangeStepState());
  }

  void removeSelectedItem(int index) {
    if (index >= 0 && index < selectedItems.length) {
      selectedItems.removeAt(index);
      emit(ChangeStepState());
    }
  }

  Future<void> addSession() async {
    showLoading();
    emit(AddSessionLoading());
    final data = selectedItems.map((item) {
      return {
        'date': item.date,
        'time': item.time,
      };
    }).toList();
    final result = await _sessionsRepo.addSession(data: {
      "sessions": data,
    }, id: treatmentPlanDetail.id);

    result.when(
      success: (data) {
        hideLoading();
        emit(AddSessionSuccess());
      },
      failure: (error) {
        hideLoading();
        emit(AddSessionError());
      },
    );
  }
}

class SelecteItem {
  SelecteItem({
    required this.date,
    required this.time,
  });

  final String date;
  final String time;
}
