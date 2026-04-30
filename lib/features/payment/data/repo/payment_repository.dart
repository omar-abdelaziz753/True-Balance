import 'package:dio/dio.dart';
import '../../../../core/networks_helper/dio_helper/dio_helper.dart';
import '../../../../core/networks_helper/dio_helper/end_points.dart';
import '../models/geidea_models.dart';

class PaymentRepository {
  Future<GeideaCheckoutResponse> initiateCheckout({
    required int bookingId,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        EndPoints.geideaInitiate,
        data: {'booking_id': bookingId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return GeideaCheckoutResponse.fromJson(response.data);
      }

      return GeideaCheckoutResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to initiate checkout',
      );
    } on DioException catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<GeideaCheckoutResponse> initiateConsultationCheckout({
    required int consultationId,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        EndPoints.initiateConsultationPayment,
        data: {'consultation_id': consultationId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        return GeideaCheckoutResponse(
          success: true,
          data: GeideaCheckoutData(
            transactionId: data['transaction_id'] ?? 0,
            sessionId: data['session_id'] ?? '',
            checkoutUrl: data['payment_url'] ?? '',
            merchantReferenceId: '',
            expiresAt:
                DateTime.now().add(const Duration(hours: 2)).toIso8601String(),
          ),
          message: 'Success',
        );
      }

      return GeideaCheckoutResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to initiate checkout',
      );
    } on DioException catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<GeideaCheckoutResponse> getCheckoutUrl({
    required int transactionId,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        EndPoints.geideaCheckoutUrl,
        data: {'transaction_id': transactionId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return GeideaCheckoutResponse.fromJson(response.data);
      }

      return GeideaCheckoutResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to get checkout URL',
      );
    } on DioException catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return GeideaCheckoutResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<PaymentStatusResponse> getPaymentStatus({
    required int transactionId,
  }) async {
    try {
      final response = await DioHelper.dio.get(
        '${EndPoints.geideaStatus}/$transactionId',
      );

      if (response.statusCode == 200) {
        return PaymentStatusResponse.fromJson(response.data);
      }

      return PaymentStatusResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to get payment status',
      );
    } on DioException catch (e) {
      return PaymentStatusResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return PaymentStatusResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<RefundResponse> processRefund({
    required int transactionId,
    double? amount,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        EndPoints.geideaRefund,
        data: {
          'transaction_id': transactionId,
          if (amount != null) 'amount': amount,
        },
      );

      if (response.statusCode == 200) {
        return RefundResponse.fromJson(response.data);
      }

      return RefundResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to process refund',
      );
    } on DioException catch (e) {
      return RefundResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return RefundResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<RefundResponse> voidTransaction({
    required int transactionId,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        EndPoints.geideaVoid,
        data: {'transaction_id': transactionId},
      );

      if (response.statusCode == 200) {
        return RefundResponse.fromJson(response.data);
      }

      return RefundResponse(
        success: false,
        message: response.data['message'] ?? 'Failed to void transaction',
      );
    } on DioException catch (e) {
      return RefundResponse(
        success: false,
        message: _handleDioError(e),
      );
    } catch (e) {
      return RefundResponse(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  Future<List<TransactionData>> getPaymentHistory({
    required int bookingId,
  }) async {
    try {
      final response = await DioHelper.dio.get(
        '${EndPoints.geideaHistory}/$bookingId',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List?;
        if (data != null) {
          return data.map((json) => TransactionData.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.connectionError:
        return 'Unable to connect to server. Please check your internet connection.';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';
        if (statusCode == 401) {
          return 'Unauthorized. Please login again.';
        } else if (statusCode == 422) {
          return message;
        } else if (statusCode == 500) {
          return 'Server error. Please try again later.';
        }
        return message;
      case DioExceptionType.cancel:
        return 'Request cancelled';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
