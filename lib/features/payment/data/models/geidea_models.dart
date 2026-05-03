class GeideaCheckoutResponse {
  final bool success;
  final String message;
  final GeideaCheckoutData? data;

  GeideaCheckoutResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory GeideaCheckoutResponse.fromJson(Map<String, dynamic> json) {
    // Backend wraps responses as `{status: "success"|"fail", data, error, code}`.
    // The previous version read `json['success']` (always missing) so success
    // was always false even on a 200 OK with a valid payment URL.
    final isSuccess = (json['status'] == 'success') || (json['success'] == true);
    return GeideaCheckoutResponse(
      success: isSuccess,
      message: json['message'] ?? json['error'] ?? '',
      data: json['data'] is Map
          ? GeideaCheckoutData.fromJson(Map<String, dynamic>.from(json['data']))
          : null,
    );
  }
}

class GeideaCheckoutData {
  final String sessionId;
  final String checkoutUrl;
  final String expiresAt;
  final int transactionId;
  final String merchantReferenceId;

  GeideaCheckoutData({
    required this.sessionId,
    required this.checkoutUrl,
    required this.expiresAt,
    required this.transactionId,
    required this.merchantReferenceId,
  });

  factory GeideaCheckoutData.fromJson(Map<String, dynamic> json) {
    // The backend returns `payment_url` from the consultation route and
    // `checkout_url` from the legacy /v1/payment/geidea/initiate route.
    // Accept either so both flows surface the URL through the same field.
    return GeideaCheckoutData(
      sessionId: json['session_id'] ?? '',
      checkoutUrl: json['payment_url'] ?? json['checkout_url'] ?? '',
      expiresAt: json['expires_at'] ?? '',
      transactionId: json['transaction_id'] ?? 0,
      merchantReferenceId: json['merchant_reference_id'] ?? '',
    );
  }
}

class PaymentStatusResponse {
  final bool success;
  final String message;
  final TransactionData? transaction;
  final Map<String, dynamic>? geideaStatus;

  PaymentStatusResponse({
    required this.success,
    required this.message,
    this.transaction,
    this.geideaStatus,
  });

  factory PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStatusResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      transaction: json['transaction'] != null
          ? TransactionData.fromJson(json['transaction'])
          : null,
      geideaStatus: json['geidea_status'],
    );
  }
}

class TransactionData {
  final int id;
  final int bookingId;
  final double amount;
  final String currency;
  final String status;
  final String? geideaOrderId;
  final String? sessionId;
  final String? merchantReferenceId;
  final String? tokenId;
  final double? paidAmount;
  final bool callbackVerified;
  final String createdAt;

  TransactionData({
    required this.id,
    required this.bookingId,
    required this.amount,
    required this.currency,
    required this.status,
    this.geideaOrderId,
    this.sessionId,
    this.merchantReferenceId,
    this.tokenId,
    this.paidAmount,
    required this.callbackVerified,
    required this.createdAt,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json['id'] ?? 0,
      bookingId: json['booking_id'] ?? 0,
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'SAR',
      status: json['status'] ?? 'pending',
      geideaOrderId: json['geidea_order_id'],
      sessionId: json['session_id'],
      merchantReferenceId: json['merchant_reference_id'],
      tokenId: json['token_id'],
      paidAmount: json['paid_amount']?.toDouble(),
      callbackVerified: json['callback_verified'] ?? false,
      createdAt: json['created_at'] ?? '',
    );
  }

  bool get isPaid => status == 'paid';
  bool get isFailed => status == 'failed';
  bool get isPending => status == 'pending';
}

class RefundResponse {
  final bool success;
  final String message;
  final String? refundId;

  RefundResponse({
    required this.success,
    required this.message,
    this.refundId,
  });

  factory RefundResponse.fromJson(Map<String, dynamic> json) {
    return RefundResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      refundId: json['refund_id'],
    );
  }
}
