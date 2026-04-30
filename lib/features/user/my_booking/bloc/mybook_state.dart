part of 'mybook_cubit.dart';

@immutable
sealed class MybookState {}

final class MybookInitial extends MybookState {}

///  get consultations
final class ConsultationsLoading extends MybookState {}

final class ConsultationsSuccess extends MybookState {}

final class ConsultationsError extends MybookState {}

final class ConsultationsLoadingMore extends MybookState {}

/// Delete Consultation Loading
class DeleteConsultationLoading extends MybookState {}

/// Delete Consultation Success
class DeleteConsultationSuccess extends MybookState {}

/// Delete Consultation Failure
class DeleteConsultationFailure extends MybookState {}

/// Add Rate Loading
class AddRateLoading extends MybookState {}

/// Add Rate Success
class AddRateSuccess extends MybookState {}

/// Add Rate Failure
class AddRateFailure extends MybookState {}

/// Initiate Payment Loading
class InitiatePaymentLoading extends MybookState {}

/// Initiate Payment Success
class InitiatePaymentSuccess extends MybookState {
  final String paymentUrl;
  final int transactionId;
  final int consultationId;
  final double amount;

  InitiatePaymentSuccess({
    required this.paymentUrl,
    required this.transactionId,
    required this.consultationId,
    required this.amount,
  });
}

/// Initiate Payment Failure
class InitiatePaymentFailure extends MybookState {
  final String message;
  InitiatePaymentFailure(this.message);
}
