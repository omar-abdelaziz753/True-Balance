import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GeideaCheckoutWebView extends StatefulWidget {
  final String checkoutUrl;
  final String returnUrl;
  final Function(PaymentResult) onComplete;
  final VoidCallback? onError;

  const GeideaCheckoutWebView({
    super.key,
    required this.checkoutUrl,
    required this.returnUrl,
    required this.onComplete,
    this.onError,
  });

  @override
  State<GeideaCheckoutWebView> createState() => _GeideaCheckoutWebViewState();
}

class _GeideaCheckoutWebViewState extends State<GeideaCheckoutWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initWebViewController();
  }

  void _initWebViewController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _errorMessage = null;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            // Check if this is the return URL
            if (request.url.startsWith(widget.returnUrl)) {
              final uri = Uri.parse(request.url);
              _handleReturnUrl(uri);
              return NavigationDecision.prevent;
            }

            // Allow all other navigation
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _errorMessage = error.description;
              _isLoading = false;
            });
            widget.onError?.call();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  void _handleReturnUrl(Uri uri) {
    final status = uri.queryParameters['status'];
    final orderId = uri.queryParameters['orderId'];
    final reference = uri.queryParameters['reference'];
    final message = uri.queryParameters['message'];

    PaymentResult result;

    switch (status) {
      case 'success':
        result = PaymentResult(
          status: PaymentStatus.success,
          orderId: orderId,
          reference: reference,
          message: 'Payment successful',
        );
        break;
      case 'failed':
        result = PaymentResult(
          status: PaymentStatus.failed,
          orderId: orderId,
          reference: reference,
          message: message ?? 'Payment failed',
        );
        break;
      case 'cancelled':
        result = PaymentResult(
          status: PaymentStatus.cancelled,
          orderId: orderId,
          reference: reference,
          message: message ?? 'Payment cancelled by user',
        );
        break;
      default:
        result = PaymentResult(
          status: PaymentStatus.unknown,
          orderId: orderId,
          reference: reference,
          message: message ?? 'Unknown payment status',
        );
    }

    widget.onComplete(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            widget.onComplete(PaymentResult(
              status: PaymentStatus.cancelled,
              message: 'Payment cancelled by user',
            ));
          },
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _errorMessage = null;
                        });
                        _controller.reload();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum PaymentStatus {
  success,
  failed,
  cancelled,
  unknown,
}

class PaymentResult {
  final PaymentStatus status;
  final String? orderId;
  final String? reference;
  final String message;

  PaymentResult({
    required this.status,
    this.orderId,
    this.reference,
    required this.message,
  });

  bool get isSuccess => status == PaymentStatus.success;
  bool get isFailed => status == PaymentStatus.failed;
  bool get isCancelled => status == PaymentStatus.cancelled;
}
