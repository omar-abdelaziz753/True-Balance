import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/repo/repos.dart';
import 'package:truee_balance_app/features/doctors/calender/data/model/doctor_schedule_model.dart';
import 'package:truee_balance_app/features/doctors/calender/data/model/therapist_schedule_model.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit(this._repos) : super(CalenderInitial());
  DateTime selectedDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 7));
  final AppointmentsRepos _repos;
  void chooseBookingDate(DateTime dateTime) async {
    selectedDate = dateTime;
    if (CacheHelper.getData(key: CacheKeys.type) == 'doctor') {
      doctorFilter();
    } else {
      thierpistFIlter();
    }

    emit(BookChangeDateState());
  }

  DateTime focusedDay = DateTime.now();

  void updateFocusedDay(DateTime day) {
    focusedDay = day;
    emit(BookChangeDateState());
  }

  DoctorScheduleModel? doctorScheduleModel;
  List<DoctorScheduleData> doctorFiletrList = [];
  Future getdoctorCalender() async {
    emit(GetDoctorCalenderLoadingState());
    final result = await _repos.getDoctorCalender();

    result.when(success: (data) {
      doctorScheduleModel = data;
      doctorFilter();
      emit(GetDoctorCalenderSuccessState());
    }, failure: (error) {
      emit(GetDoctorCalenderErrorState());
    });
  }

  void doctorFilter() {
    doctorFiletrList = doctorScheduleModel!.data!.data!
        .where((element) =>
            element.date == selectedDate.toString().split(' ').first)
        .toList();
  }

  TherapistScheduleModel? therapistScheduleModel;
  List<TherapistSchedule> therapistFiletrList = [];
  Future getTheipstCalender() async {
    emit(GetDoctorCalenderLoadingState());
    final result = await _repos.getTheipstCalender();

    result.when(success: (data) {
      therapistScheduleModel = data;
      thierpistFIlter();
      emit(GetDoctorCalenderSuccessState());
    }, failure: (error) {
      emit(GetDoctorCalenderErrorState());
    });
  }

  void thierpistFIlter() {
    therapistFiletrList = therapistScheduleModel!.data!.data!
        .where((element) =>
            element.date == selectedDate.toString().split(' ').first)
        .toList();
  }

  void getApiBaseonRole() async {
    if (CacheHelper.getData(key: CacheKeys.type) == 'doctor') {
      await getdoctorCalender();
    } else {
      await getTheipstCalender();
    }
  }
}
