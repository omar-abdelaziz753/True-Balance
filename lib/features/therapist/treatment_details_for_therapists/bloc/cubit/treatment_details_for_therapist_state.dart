part of 'treatment_details_for_therapist_cubit.dart';

abstract class TreatmentDetailsForTherapistState {}

class TreatmentDetailsForTherapistStateInitial extends TreatmentDetailsForTherapistState {}

class TreatmentDetailsForTherapistStateLoading extends TreatmentDetailsForTherapistState {}

class TreatmentDetailsForTherapistStateSuccess extends TreatmentDetailsForTherapistState {}

class TreatmentDetailsForTherapistStateError extends TreatmentDetailsForTherapistState {}

class TreatmentDetailsForTherapistStateLoadingMore extends TreatmentDetailsForTherapistState {}





final class RateSessionSuccessState extends TreatmentDetailsForTherapistState {}

final class RateSessionFailureState extends TreatmentDetailsForTherapistState {}

final class RateSessionLoadingState extends TreatmentDetailsForTherapistState {}
