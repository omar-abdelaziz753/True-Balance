part of 'details_for_therapists_cubit.dart';

@immutable
sealed class DetailsForTherapistsState {}

final class DetailsForTherapistsInitial extends DetailsForTherapistsState {}

/// get user treatment plans
final class GetSUserTreatmentplansLoadingState extends DetailsForTherapistsState {}

final class GetSUserTreatmentplansSuccessState extends DetailsForTherapistsState {}

final class GetSUserTreatmentplansErrorState extends DetailsForTherapistsState {}

final class GetSUserTreatmentplansLoadingMore extends DetailsForTherapistsState {}






