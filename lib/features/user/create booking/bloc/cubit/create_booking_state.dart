part of 'create_booking_cubit.dart';

sealed class CreateBookingState {}

final class CreateBookingInitial extends CreateBookingState {}

final class ChangeStepState extends CreateBookingState {}

final class DateSelectedState extends CreateBookingState {}

final class TimeSelectedState extends CreateBookingState {}

final class PickDateAndTimeState extends CreateBookingState {}

final class RemoveDateAndTimeState extends CreateBookingState {}

class SlotsLoadingState extends CreateBookingState {}

class SlotsLoadedState extends CreateBookingState {}

class SlotsFailureState extends CreateBookingState {}

class BookingLoadingState extends CreateBookingState {}

class BookingSuccessState extends CreateBookingState {}

class BookingFailureState extends CreateBookingState {}
