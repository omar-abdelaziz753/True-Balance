part of 'calender_cubit.dart';

sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}

final class BookChangeDateState extends CalenderState {}

final class ChangeStatusState extends CalenderState {}

final class GetDoctorCalenderErrorState extends CalenderState {}

final class GetDoctorCalenderSuccessState extends CalenderState {}

final class GetDoctorCalenderLoadingState extends CalenderState {}
