import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/helper_functions/date_formate.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/free_slots_model.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/repo/create_booking_repo.dart';

part 'create_booking_state.dart';

class CreateBookingCubit extends Cubit<CreateBookingState> {
  CreateBookingCubit(this._createBookingRepo) : super(CreateBookingInitial());
  final CreateBookingRepo? _createBookingRepo;
  int currentStep = 0;
  void nextStep() {
    currentStep++;
    emit(ChangeStepState());
  }

  DateTime data = DateTime.now();

  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;
  void selectDate({required int index, required DateTime date}) {
    if (selectedDateIndex == index) return;
    data = date;
    selectedDateIndex = index;
    emit(DateSelectedState());
    selectedTimeIndex = -1;
    getAvailableSlots(doctorId: doctorId);
  }

  void selectTime(int index) {
    selectedTimeIndex = index;
    emit(TimeSelectedState());
  }

  FreeSlotsModel? freeSlotsModel;
  int doctorId = 0;

  Future<void> getAvailableSlots({
    required int doctorId,
  }) async {
    emit(SlotsLoadingState());
    this.doctorId = doctorId;
    final result = await _createBookingRepo!.getSlots(
      doctorId: doctorId,
      date: formatDate(data.toString()),
    );
    result.when(
      success: (data) {
        freeSlotsModel = data;
        emit(SlotsLoadedState());
      },
      failure: (error) {
        emit(SlotsFailureState());
      },
    );
  }

  Future<void> bookSelectedSession() async {
    emit(BookingLoadingState());
    showLoading();

    final result = await _createBookingRepo!.bookSession(
      doctorId: doctorId,
      date: formatDate(data.toString()),
      time: freeSlotsModel!.data[selectedTimeIndex],
    );

    result.when(
      success: (_) {
        hideLoading();

        emit(BookingSuccessState());
      },
      failure: (error) {
        hideLoading();

        emit(BookingFailureState());
      },
    );
  }

  AllTherapistDataModel? allTherapistDataModel;

  /// Get All Therapist
  Future<void> getAllTherapist() async {
    emit(GetAllTherapistLoadingState());
    final result = await _createBookingRepo!.getAllTherapist();
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
}
