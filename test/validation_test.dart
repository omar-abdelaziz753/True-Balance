import 'package:flutter_test/flutter_test.dart';
import 'package:true_balance_app/core/helper_functions/validation.dart';

void main() {
  group('AppValidator.validateSaudiPhoneNumber', () {
    test('accepts 10-digit numbers starting with 05', () {
      expect(AppValidator.validateSaudiPhoneNumber('0512345678'), isNull);
      expect(AppValidator.validateSaudiPhoneNumber('0598765432'), isNull);
      expect(AppValidator.validateSaudiPhoneNumber('0500000000'), isNull);
    });

    test('rejects null and empty input', () {
      expect(AppValidator.validateSaudiPhoneNumber(null), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber(''), isNotNull);
    });

    test('rejects numbers with the wrong length', () {
      expect(AppValidator.validateSaudiPhoneNumber('051234567'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('05123456789'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('05'), isNotNull);
    });

    test('rejects numbers with the wrong prefix or format', () {
      expect(AppValidator.validateSaudiPhoneNumber('0112345678'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('1512345678'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('+966512345678'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('05abcdefgh'), isNotNull);
      expect(AppValidator.validateSaudiPhoneNumber('05 12345678'), isNotNull);
    });
  });

  group('AppValidator.validateOTP', () {
    test('accepts exactly 6 digits', () {
      expect(AppValidator.validateOTP('123456'), isNull);
      expect(AppValidator.validateOTP('000000'), isNull);
    });

    test('rejects null and empty input', () {
      expect(AppValidator.validateOTP(null), isNotNull);
      expect(AppValidator.validateOTP(''), isNotNull);
    });

    test('rejects codes that are not 6 digits', () {
      expect(AppValidator.validateOTP('12345'), isNotNull);
      expect(AppValidator.validateOTP('1234567'), isNotNull);
      expect(AppValidator.validateOTP('abcdef'), isNotNull);
      expect(AppValidator.validateOTP('12 456'), isNotNull);
      expect(AppValidator.validateOTP('12345a'), isNotNull);
    });
  });
}
