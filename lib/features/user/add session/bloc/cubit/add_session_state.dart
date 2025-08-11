part of 'add_session_cubit.dart';

abstract class AddSessionState {}

final class AddSessionInitial extends AddSessionState {}

final class ChangeStepState extends AddSessionState {}

final class AddSessionLoading extends AddSessionState {}

final class AddSessionError extends AddSessionState {}

final class AddSessionSuccess extends AddSessionState {

}

final class PickDateAndTimeState extends AddSessionState {}
