import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:true_balance_app/core/helper_functions/date_format.dart';
import 'package:true_balance_app/core/utils/easy_loading.dart';
import 'package:true_balance_app/features/user/create%20booking/data/model/free_slots_model.dart';
import 'package:true_balance_app/features/user/create%20booking/data/repo/create_booking_repo.dart';

part 'create_booking_state.dart';

class CreateBookingCubit extends Cubit<CreateBookingState> {
  CreateBookingCubit(this._createBookingRepo) : super(CreateBookingInitial());
  final CreateBookingRepo? _createBookingRepo;
  int currentStep = 0;

  String? paymentUrl;
  int? transactionId;
  int? consultationId;
  double? amount;

  String userNotes = '';

  void setNotes(String notes) {
    userNotes = notes;
  }

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
  bool _isBooking = false;

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
    if (_isBooking) return;
    _isBooking = true;
    try {
      emit(BookingLoadingState());
      showLoading();

      final result = await _createBookingRepo!.bookSession(
        doctorId: doctorId,
        date: formatDate(data.toString()),
        time: freeSlotsModel!.data[selectedTimeIndex],
        notes: userNotes.isNotEmpty ? userNotes : null,
      );

      result.when(
        success: (data) {
          hideLoading();

          // Extract payment data from response
          final responseData = data as Map<String, dynamic>?;
          paymentUrl = responseData?['payment_url'];
          transactionId = responseData?['transaction_id'];
          consultationId = responseData?['consultation_id'];
          amount = (responseData?['amount'] ?? 0).toDouble();

          if (paymentUrl != null) {
            emit(BookingPaymentRequired(
              paymentUrl: paymentUrl!,
              transactionId: transactionId ?? 0,
              consultationId: consultationId ?? 0,
              amount: amount ?? 0,
            ));
          } else {
            emit(BookingSuccessState());
          }
        },
        failure: (error) {
          hideLoading();

          emit(BookingFailureState(error.toString()));
        },
      );
    } finally {
      _isBooking = false;
    }
  }
}
