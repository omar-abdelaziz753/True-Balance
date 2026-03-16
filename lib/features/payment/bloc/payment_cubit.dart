import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/payment_repository.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _repository;
  int? _currentTransactionId;

  PaymentCubit({PaymentRepository? repository})
      : _repository = repository ?? PaymentRepository(),
        super(PaymentInitial());

  int? get currentTransactionId => _currentTransactionId;

  Future<void> initiatePayment({
    required int bookingId,
  }) async {
    emit(PaymentLoading());

    final response = await _repository.initiateCheckout(bookingId: bookingId);

    if (response.success && response.data != null) {
      _currentTransactionId = response.data!.transactionId;
      emit(CheckoutInitiated(response.data!));
    } else {
      emit(PaymentFailed(response.message));
    }
  }

  Future<void> getCheckoutUrl({
    required int transactionId,
  }) async {
    emit(PaymentLoading());

    final response = await _repository.getCheckoutUrl(
      transactionId: transactionId,
    );

    if (response.success && response.data != null) {
      _currentTransactionId = transactionId;
      emit(CheckoutUrlLoaded(
        checkoutUrl: response.data!.checkoutUrl,
        sessionId: response.data!.sessionId,
        transactionId: transactionId,
        expiresAt: DateTime.parse(response.data!.expiresAt),
      ));
    } else {
      emit(PaymentFailed(response.message));
    }
  }

  Future<void> checkPaymentStatus({
    required int transactionId,
  }) async {
    emit(PaymentLoading());

    final response = await _repository.getPaymentStatus(
      transactionId: transactionId,
    );

    if (response.success && response.transaction != null) {
      final transaction = response.transaction!;

      if (transaction.isPaid) {
        emit(PaymentSuccess(transaction));
      } else if (transaction.isFailed) {
        emit(PaymentFailed('Payment failed', transactionId: transactionId));
      } else {
        emit(PaymentLoading());
      }
    } else {
      emit(PaymentError(response.message));
    }
  }

  Future<void> processRefund({
    required int transactionId,
    double? amount,
  }) async {
    emit(RefundProcessing());

    final response = await _repository.processRefund(
      transactionId: transactionId,
      amount: amount,
    );

    if (response.success) {
      emit(RefundSuccess(response.message));
    } else {
      emit(RefundFailed(response.message));
    }
  }

  Future<void> voidTransaction({
    required int transactionId,
  }) async {
    emit(PaymentLoading());

    final response = await _repository.voidTransaction(
      transactionId: transactionId,
    );

    if (response.success) {
      emit(PaymentCancelled());
    } else {
      emit(PaymentFailed(response.message));
    }
  }

  Future<void> loadPaymentHistory({
    required int bookingId,
  }) async {
    emit(PaymentLoading());

    final transactions = await _repository.getPaymentHistory(
      bookingId: bookingId,
    );

    emit(PaymentHistoryLoaded(transactions));
  }

  void resetState() {
    _currentTransactionId = null;
    emit(PaymentInitial());
  }
}
