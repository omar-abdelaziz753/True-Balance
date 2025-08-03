part of 'create_booking_cubit.dart';

sealed class CreateBookingState {}

final class CreateBookingInitial extends CreateBookingState {}

final class ChangeStepState extends CreateBookingState {}

final class DateSelectedState extends CreateBookingState {}

final class TimeSelectedState extends CreateBookingState {}

final class PickDateAndTimeState extends CreateBookingState {}

final class RemoveDateAndTimeState extends CreateBookingState {}
