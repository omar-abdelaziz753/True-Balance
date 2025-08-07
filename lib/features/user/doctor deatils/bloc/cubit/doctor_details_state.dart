part of 'doctor_details_cubit.dart';

abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsSuccess extends DoctorDetailsState {

}

class DoctorDetailsFailure extends DoctorDetailsState {

}
