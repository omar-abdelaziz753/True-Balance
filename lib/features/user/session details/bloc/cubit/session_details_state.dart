part of 'session_details_cubit.dart';

sealed class SessionDetailsState {}

final class SessionDetailsInitial extends SessionDetailsState {}

/// Get By Therapist
final class GetByTherapistLoadingState extends SessionDetailsState {}

final class GetByTherapistSuccessState extends SessionDetailsState {}

final class GetByTherapistFailureState extends SessionDetailsState {}

final class GetByTherapistDetailLoadingState extends SessionDetailsState {}

final class GetByTherapistDetailSuccessState extends SessionDetailsState {}

final class GetByTherapistDetailFailureState extends SessionDetailsState {}
