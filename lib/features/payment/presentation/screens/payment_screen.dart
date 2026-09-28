import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/payment_cubit.dart';
import '../../bloc/payment_state.dart';
import '../widgets/geidea_checkout_webview.dart';

class PaymentScreen extends StatefulWidget {
  final int bookingId;
  final double amount;
  final String currency;
  final VoidCallback? onPaymentSuccess;
  final VoidCallback? onPaymentFailed;
  final VoidCallback? onPaymentCancelled;
  final bool isForConsultation;

  const PaymentScreen({
    super.key,
    required this.bookingId,
    required this.amount,
    this.currency = 'SAR',
    this.onPaymentSuccess,
    this.onPaymentFailed,
    this.onPaymentCancelled,
    this.isForConsultation = false,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final PaymentCubit _paymentCubit;
  String? _checkoutUrl;
  int? _transactionId;
  // Hint from the checkout return URL while we wait for the authoritative
  // server-side status check to complete.
  PaymentResult? _pendingHint;

  @override
  void initState() {
    super.initState();
    _paymentCubit = PaymentCubit();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    if (widget.isForConsultation) {
      await _paymentCubit.initiateConsultationPayment(
          consultationId: widget.bookingId);
    } else {
      await _paymentCubit.initiatePayment(bookingId: widget.bookingId);
    }
  }

  @override
  void dispose() {
    _paymentCubit.close();
    super.dispose();
  }

  /// Fallback when there is no transaction to verify against:
  /// trust the return-URL hint directly.
  void _handleUnverifiedResult(PaymentResult result) {
    if (result.isSuccess) {
      widget.onPaymentSuccess?.call();
    } else {
      if (result.isCancelled) {
        widget.onPaymentCancelled?.call();
      } else {
        widget.onPaymentFailed?.call();
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _paymentCubit,
      child: Scaffold(
        appBar: AppBar(elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 0,
          leading: BackButton(
            onPressed: () {
              widget.onPaymentCancelled?.call();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is CheckoutInitiated) {
              _paymentCubit.getCheckoutUrl(
                transactionId: state.checkoutData.transactionId,
              );
            } else if (state is CheckoutUrlLoaded) {
              setState(() {
                _checkoutUrl = state.checkoutUrl;
                _transactionId = state.transactionId;
              });
            } else if (state is PaymentSuccess) {
              _pendingHint = null;
              widget.onPaymentSuccess?.call();
            } else if (state is PaymentFailed) {
              // A failure carrying a transaction id is the verdict of the
              // server-side status check for a checkout return hint.
              if (_pendingHint != null && state.transactionId != null) {
                final hint = _pendingHint!;
                _pendingHint = null;
                if (hint.isCancelled) {
                  widget.onPaymentCancelled?.call();
                } else {
                  widget.onPaymentFailed?.call();
                }
                if (mounted) Navigator.of(context).pop();
              } else {
                widget.onPaymentFailed?.call();
              }
            } else if (state is PaymentCancelled) {
              widget.onPaymentCancelled?.call();
            }
          },
          builder: (context, state) {
            if (state is PaymentLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text('initializingPayment'.tr(), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                  ],
                ),
              );
            }

            if (state is PaymentVerifying) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        'verifyingPayment'.tr(),
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${state.attempt} / ${state.maxAttempts}',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is PaymentFailed) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _initiatePayment,
                        child: const Text('Try Again'),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          widget.onPaymentCancelled?.call();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is PaymentError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _initiatePayment,
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (_checkoutUrl != null && _transactionId != null) {
              return GeideaCheckoutWebView(
                checkoutUrl: _checkoutUrl!,
                returnUrl: 'truebalance://payment/return',
                onComplete: (result) {
                  if (_transactionId == null) {
                    _handleUnverifiedResult(result);
                    return;
                  }
                  // The return-URL param is only a hint; the backend status
                  // check is authoritative for every terminal outcome
                  // (success, failed, cancelled, unknown).
                  _pendingHint = result;
                  _paymentCubit.checkPaymentStatus(
                      transactionId: _transactionId!);
                },
                onError: () {
                  widget.onPaymentFailed?.call();
                  if (mounted) Navigator.of(context).pop();
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
