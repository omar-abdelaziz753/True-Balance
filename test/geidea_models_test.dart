import 'package:flutter_test/flutter_test.dart';
import 'package:true_balance_app/features/payment/data/models/geidea_models.dart';

void main() {
  group('GeideaCheckoutData.fromJson', () {
    test('accepts the payment_url shape (consultation route)', () {
      final data = GeideaCheckoutData.fromJson({
        'session_id': 'session-1',
        'payment_url': 'https://pay.example/checkout/1',
        'expires_at': '2026-01-01T00:00:00Z',
        'transaction_id': 7,
        'merchant_reference_id': 'merchant-1',
      });

      expect(data.sessionId, 'session-1');
      expect(data.checkoutUrl, 'https://pay.example/checkout/1');
      expect(data.transactionId, 7);
    });

    test('accepts the checkout_url shape (legacy initiate route)', () {
      final data = GeideaCheckoutData.fromJson({
        'session_id': 'session-2',
        'checkout_url': 'https://pay.example/checkout/2',
        'expires_at': '2026-01-01T00:00:00Z',
        'transaction_id': 8,
        'merchant_reference_id': 'merchant-2',
      });

      expect(data.checkoutUrl, 'https://pay.example/checkout/2');
    });

    test('prefers payment_url when both shapes are present', () {
      final data = GeideaCheckoutData.fromJson({
        'session_id': 'session-3',
        'payment_url': 'https://pay.example/p',
        'checkout_url': 'https://pay.example/c',
      });

      expect(data.checkoutUrl, 'https://pay.example/p');
    });

    test('falls back to empty string when no URL is present', () {
      final data = GeideaCheckoutData.fromJson({'session_id': 'session-4'});

      expect(data.checkoutUrl, isEmpty);
      expect(data.sessionId, 'session-4');
      expect(data.expiresAt, isEmpty);
      expect(data.transactionId, 0);
      expect(data.merchantReferenceId, isEmpty);
    });
  });

  group('GeideaCheckoutResponse.fromJson', () {
    Map<String, dynamic> dataWith({required String urlKey}) => {
          'session_id': 's',
          'urlKey': 'placeholder',
          'expires_at': '',
          'transaction_id': 1,
          'merchant_reference_id': 'm',
        }..[urlKey] = 'https://pay.example/x';

    test('treats the status=success wrapper as success', () {
      final response = GeideaCheckoutResponse.fromJson({
        'status': 'success',
        'message': 'ok',
        'data': dataWith(urlKey: 'payment_url'),
      });

      expect(response.success, isTrue);
      expect(response.data, isNotNull);
      expect(response.data!.checkoutUrl, 'https://pay.example/x');
    });

    test('treats the status=fail wrapper as failure with the error text', () {
      final response = GeideaCheckoutResponse.fromJson({
        'status': 'fail',
        'error': 'boom',
        'code': 400,
      });

      expect(response.success, isFalse);
      expect(response.message, 'boom');
      expect(response.data, isNull);
    });

    test('supports the legacy success-bool shape', () {
      final response = GeideaCheckoutResponse.fromJson({
        'success': true,
        'message': 'ok',
        'data': dataWith(urlKey: 'checkout_url'),
      });

      expect(response.success, isTrue);
      expect(response.data!.checkoutUrl, 'https://pay.example/x');
    });

    test('yields null data when the payload has no data map', () {
      final response = GeideaCheckoutResponse.fromJson({
        'status': 'success',
        'message': 'ok',
      });

      expect(response.success, isTrue);
      expect(response.data, isNull);
    });
  });
}
