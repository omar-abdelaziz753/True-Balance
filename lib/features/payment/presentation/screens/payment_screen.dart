import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  const PaymentScreen({
    super.key,
    required this.bookingId,
    required this.amount,
    this.currency = 'SAR',
    this.onPaymentSuccess,
    this.onPaymentFailed,
    this.onPaymentCancelled,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final PaymentCubit _paymentCubit;
  String? _checkoutUrl;
  int? _transactionId;

  @override
  void initState() {
    super.initState();
    _paymentCubit = PaymentCubit();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    await _paymentCubit.initiatePayment(bookingId: widget.bookingId);
  }

  @override
  void dispose() {
    _paymentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _paymentCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          leading: IconButton(
            icon: const Icon(Icons.close),
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
              widget.onPaymentSuccess?.call();
            } else if (state is PaymentFailed) {
              widget.onPaymentFailed?.call();
            } else if (state is PaymentCancelled) {
              widget.onPaymentCancelled?.call();
            }
          },
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Initializing payment...'),
                  ],
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
                  if (result.isSuccess) {
                    _paymentCubit.checkPaymentStatus(
                        transactionId: _transactionId!);
                  } else if (result.isCancelled) {
                    widget.onPaymentCancelled?.call();
                    Navigator.of(context).pop();
                  } else {
                    widget.onPaymentFailed?.call();
                    Navigator.of(context).pop();
                  }
                },
                onError: () {
                  widget.onPaymentFailed?.call();
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
