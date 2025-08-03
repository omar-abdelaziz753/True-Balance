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

  final Map<String, List<String>> availableDateTime = {
    '2025-06-25': ['09:00', '11:00'],
    '2025-06-27': ['10:00', '14:00'],
  };

  Map<String, List<String>> get available => availableDateTime;
  List<Map<String, String>> selectedSessions = [];
  bool isDuplicate(String date, String time) {
    return selectedSessions.any(
      (session) => session['date'] == date && session['time'] == time,
    );
  }

  void addSession(String date, String time) {
    if (isDuplicate(date, time)) return;

    selectedSessions.add({'date': date, 'time': time, });

    emit(PickDateAndTimeState());
  }

  void removeSessionAt(int index) {
    selectedSessions.removeAt(index);

    emit(RemoveDateAndTimeState());
  }
}
