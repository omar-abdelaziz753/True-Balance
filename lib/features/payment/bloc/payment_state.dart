import 'package:equatable/equatable.dart';
import '../data/models/geidea_models.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

/// Emitted while we are polling Geidea for the final transaction status after
/// the user returned from the hosted checkout page. Distinct from
/// [PaymentLoading] so the UI can show a "verifying your payment…" message
/// instead of a generic spinner.
class PaymentVerifying extends PaymentState {
  final int transactionId;
  final int attempt;
  final int maxAttempts;

  const PaymentVerifying({
    required this.transactionId,
    required this.attempt,
    required this.maxAttempts,
  });

  @override
  List<Object?> get props => [transactionId, attempt, maxAttempts];
}

class CheckoutInitiated extends PaymentState {
  final GeideaCheckoutData checkoutData;

  const CheckoutInitiated(this.checkoutData);

  @override
  List<Object?> get props => [checkoutData];
}

class CheckoutUrlLoaded extends PaymentState {
  final String checkoutUrl;
  final String sessionId;
  final int transactionId;
  final DateTime expiresAt;

  const CheckoutUrlLoaded({
    required this.checkoutUrl,
    required this.sessionId,
    required this.transactionId,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [checkoutUrl, sessionId, transactionId, expiresAt];
}

class PaymentSuccess extends PaymentState {
  final TransactionData transaction;

  const PaymentSuccess(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class PaymentFailed extends PaymentState {
  final String message;
  final int? transactionId;

  const PaymentFailed(this.message, {this.transactionId});

  @override
  List<Object?> get props => [message, transactionId];
}

class PaymentCancelled extends PaymentState {}

class RefundProcessing extends PaymentState {}

class RefundSuccess extends PaymentState {
  final String message;

  const RefundSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RefundFailed extends PaymentState {
  final String message;

  const RefundFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class PaymentHistoryLoaded extends PaymentState {
  final List<TransactionData> transactions;

  const PaymentHistoryLoaded(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

class PaymentError extends PaymentState {
  final String message;

  const PaymentError(this.message);

  @override
  List<Object?> get props => [message];
}
