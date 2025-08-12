part of 'mybook_cubit.dart';

@immutable
sealed class MybookState {}

final class MybookInitial extends MybookState {}

///  get consultations
final class ConsultationsLoading extends MybookState {}

final class ConsultationsSuccess extends MybookState {}

final class ConsultationsError extends MybookState {}

final class ConsultationsLoadingMore extends MybookState {}
