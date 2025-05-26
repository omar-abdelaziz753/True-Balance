import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_booking_state.dart';

class CreateBookingCubit extends Cubit<CreateBookingState> {
  CreateBookingCubit() : super(CreateBookingInitial());
  int currentStep = 0;
  void nextStep() {
    currentStep++;
    emit(ChangeStepState());
  }

  int selectedDateIndex = -1;
  int selectedTimeIndex = -1;
  void selectDate(int index) {
    selectedDateIndex = index;
    emit(DateSelectedState());
  }

  void selectTime(int index) {
    selectedTimeIndex = index;
    emit(TimeSelectedState());
  }
}
