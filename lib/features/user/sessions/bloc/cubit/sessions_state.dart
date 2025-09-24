part of 'sessions_cubit.dart';

abstract class SessionsState {}

class SessionsInitial extends SessionsState {}

class GetAllTherapistLoadingState extends SessionsState {}

class GetAllTherapistSuccessState extends SessionsState {}

class GetAllTherapistFailureState extends SessionsState {
  final String message;
  GetAllTherapistFailureState({required this.message});
}

class GetAllTherapistLoadingMoreState extends SessionsState {}