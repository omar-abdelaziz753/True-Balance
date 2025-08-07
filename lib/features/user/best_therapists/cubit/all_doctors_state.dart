part of 'all_doctors_cubit.dart';

sealed class AllDoctorsState {}

final class AllDoctorsInitial extends AllDoctorsState {}

class DoctorsLoading extends AllDoctorsState {}

class DoctorsSuccess extends AllDoctorsState {}

class DoctorsFailure extends AllDoctorsState {}

// class DoctorsPaginationLoading extends AllDoctorsState {}

class DoctorsLoadingMore extends AllDoctorsState {}
