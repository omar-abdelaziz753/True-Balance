import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/payment_repository.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _repository;
  int? _currentTransactionId;
  bool _isInitiating = false;

  PaymentCubit({PaymentRepository? repository})
      : _repository = repository ?? PaymentRepository(),
        super(PaymentInitial());

  int? get currentTransactionId => _currentTransactionId;

  Future<void> initiatePayment({
    required int bookingId,
  }) async {
    if (_isInitiating) return;
    _isInitiating = true;
    try {
      emit(PaymentLoading());

      final response = await _repository.initiateCheckout(bookingId: bookingId);

      if (response.success && response.data != null) {
        _currentTransactionId = response.data!.transactionId;
        emit(CheckoutInitiated(response.data!));
      } else {
        emit(PaymentFailed(response.message));
      }
    } finally {
      _isInitiating = false;
    }
  }

  Future<void> initiateConsultationPayment({
    required int consultationId,
  }) async {
    emit(PaymentLoading());

    final response = await _repository.initiateConsultationCheckout(
        consultationId: consultationId);

    if (response.success && response.data != null) {
      _currentTransactionId = response.data!.transactionId;
      // For consultations, we already have the checkout URL, so emit CheckoutUrlLoaded directly
      emit(CheckoutUrlLoaded(
        checkoutUrl: response.data!.checkoutUrl,
        sessionId: response.data!.sessionId,
        transactionId: response.data!.transactionId,
        expiresAt: DateTime.tryParse(response.data!.expiresAt) ??
            DateTime.now().add(const Duration(hours: 2)),
      ));
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
        expiresAt: DateTime.tryParse(response.data!.expiresAt) ??
            DateTime.now().add(const Duration(hours: 2)),
      ));
    } else {
      emit(PaymentFailed(response.message));
    }
  }

  /// Polls the backend for the final transaction status, with bounded retries
  /// and exponential backoff. Geidea posts the authoritative result via
  /// server-to-server callback, so the client just needs to wait for it to
  /// land. We give up after [_maxStatusPollAttempts] tries to avoid an
  /// indefinite spinner if the callback is delayed or lost.
  static const int _maxStatusPollAttempts = 6;
  static const Duration _initialPollDelay = Duration(seconds: 2);

  Future<void> checkPaymentStatus({
    required int transactionId,
  }) async {
    Duration delay = _initialPollDelay;

    for (int attempt = 1; attempt <= _maxStatusPollAttempts; attempt++) {
      if (isClosed) return;
      emit(PaymentVerifying(
        transactionId: transactionId,
        attempt: attempt,
        maxAttempts: _maxStatusPollAttempts,
      ));

      final response = await _repository.getPaymentStatus(
        transactionId: transactionId,
      );

      if (!response.success || response.transaction == null) {
        // Network/API error — surface it; don't keep hammering.
        emit(PaymentError(response.message));
        return;
      }

      final transaction = response.transaction!;
      if (transaction.isPaid) {
        emit(PaymentSuccess(transaction));
        return;
      }
      if (transaction.isFailed) {
        emit(PaymentFailed('Payment failed', transactionId: transactionId));
        return;
      }

      // Still pending — wait before polling again, then back off.
      if (attempt < _maxStatusPollAttempts) {
        await Future.delayed(delay);
        delay *= 2;
      }
    }

    // Exhausted retries — Geidea callback hasn't arrived yet. Tell the user
    // their payment is still being verified rather than locking the UI.
    emit(PaymentFailed(
      'Payment verification is taking longer than expected. Check back in a few moments.',
      transactionId: transactionId,
    ));
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
