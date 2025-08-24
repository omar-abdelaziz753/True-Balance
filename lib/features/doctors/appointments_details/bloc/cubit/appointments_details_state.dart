part of 'appointments_details_cubit.dart';

abstract class AppointmentsDetailsState {}

class AppointmentsDetailsInitial extends AppointmentsDetailsState {}

class AppointmentsDetailsLoading extends AppointmentsDetailsState {}

class AppointmentsDetailsSuccess extends AppointmentsDetailsState {}

class AppointmentsDetailsError extends AppointmentsDetailsState {}

class AppointmentsDetailsLoadingMore extends AppointmentsDetailsState {}

class AppointmentsDetailsSubmitting extends AppointmentsDetailsState {}

class AppointmentsDetailsSubmittedSuccessfully
    extends AppointmentsDetailsState {}

class AppointmentsDetailsSubmissionError extends AppointmentsDetailsState {}
class AppointmentsDetailsUpdated extends AppointmentsDetailsState {}
