part of 'sessions_cubit.dart';

abstract class SessionsState {}

final class SessionsInitial extends SessionsState {}

/// Get All Therapist
final class GetAllTherapistLoadingState extends SessionsState {}

final class GetAllTherapistSuccessState extends SessionsState {}

final class GetAllTherapistFailureState extends SessionsState {
  final String message;
  GetAllTherapistFailureState({required this.message});
}

/// Get By Therapist
final class GetByTherapistLoadingState extends SessionsState {}

final class GetByTherapistSuccessState extends SessionsState {}

final class GetByTherapistFailureState extends SessionsState {
  final String message;
  GetByTherapistFailureState({required this.message});
}
