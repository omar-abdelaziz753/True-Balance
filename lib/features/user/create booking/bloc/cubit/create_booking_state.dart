part of 'create_booking_cubit.dart';


sealed class CreateBookingState {}

final class CreateBookingInitial extends CreateBookingState {}
final class ChangeStepState extends CreateBookingState {}
class DateSelectedState extends CreateBookingState {

}

class TimeSelectedState extends CreateBookingState {

}