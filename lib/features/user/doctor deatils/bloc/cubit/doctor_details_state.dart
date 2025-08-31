part of 'doctor_details_cubit.dart';

abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsSuccess extends DoctorDetailsState {}

class DoctorDetailsFailure extends DoctorDetailsState {}

class DoctorReviewsLoading extends DoctorDetailsState {}

class DoctorReviewsLoadingMore extends DoctorDetailsState {}

class DoctorReviewsSuccess extends DoctorDetailsState {}

class DoctorReviewsFailure extends DoctorDetailsState {}
