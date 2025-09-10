part of 'mybook_cubit.dart';

@immutable
sealed class MybookState {}

final class MybookInitial extends MybookState {}

///  get consultations
final class ConsultationsLoading extends MybookState {}

final class ConsultationsSuccess extends MybookState {}

final class ConsultationsError extends MybookState {}

final class ConsultationsLoadingMore extends MybookState {}

/// Add Rate Loading
class AddRateLoading extends MybookState {}

/// Add Rate Success
class AddRateSuccess extends MybookState {}

/// Add Rate Failure
class AddRateFailure extends MybookState {}
