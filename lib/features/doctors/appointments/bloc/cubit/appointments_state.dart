
abstract class AppointmentsState {}

/// get consultations doctors 
class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsSuccess extends AppointmentsState {}

class AppointmentsError extends AppointmentsState {}

class AppointmentsLoadingMore extends AppointmentsState {}