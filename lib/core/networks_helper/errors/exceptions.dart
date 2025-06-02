import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/error_model.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class ToastManager {
  static OverlayEntry? _overlayEntry;

  static void showCustomToast({
    required String message,
    Color backgroundColor = Colors.red,
    IconData icon = Icons.error_outline,
    Duration duration = const Duration(seconds: 5),
  }) {
    final overlayState = AppConstants.navigatorKey.currentState?.overlay;

    if (overlayState == null) {
      if (kDebugMode) {
        print("Error: OverlayState is null. Make sure navigatorKey is set.");
      }
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100.h,
        left: 20.w,
        right: 20.w,
        child: Material(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.r,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 22.sp),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);

    Future.delayed(duration, () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);

  // factory ServerException.fromResponse(int? statusCode, dynamic response,
  //     {String? message}) {
  //   debugPrint("Raw response: $response");

  //   final data = response is Response ? response.data : response;

  //   final errorData = data is String
  //       ? jsonDecode(data)
  //       : data is Map<String, dynamic>
  //           ? data
  //           : <String, dynamic>{};

  //   debugPrint("Parsed errorData: $errorData");

  //   final String errorMessage = errorData["message"] ??
  //       errorData["error"] ??
  //       message ??
  //       'An unexpected error occurred';

  //   final errorModel = ErrorModel(
  //     message: errorMessage,
  //     error: errorData["error"] is Map<String, dynamic>
  //         ? errorData["error"]
  //         : null,
  //   );

  //   ToastManager.showCustomToast(
  //     message: errorModel.message,
  //     backgroundColor: Colors.red,
  //     icon: Icons.error_outline,
  //     duration: const Duration(seconds: 3),
  //   );

  //   return ServerException(errorModel);
  // }

  factory ServerException.fromResponse(int? statusCode, dynamic response,
      {String? message}) {
    debugPrint("Raw response: $response");

    final data = response is Response ? response.data : response;

    final errorData = data is String
        ? jsonDecode(data)
        : data is Map<String, dynamic>
            ? data
            : <String, dynamic>{}; // Safe fallback

    debugPrint("Parsed errorData: $errorData");

    final String errorMessage = errorData["message"] ??
        errorData["error"] ?? // <- used if "message" is missing
        message ??
        'An unexpected error occurred';

    final errorField = errorData["errors"];

    final errorModel = ErrorModel(
      message: errorMessage,
      error: errorField  is Map<String, dynamic> ? errorField : null,
    );

    ToastManager.showCustomToast(
      message: errorModel.message,
      backgroundColor: Colors.red,
      icon: Icons.error_outline,
      duration: const Duration(seconds: 3),
    );

    return ServerException(errorModel);
  }
}

class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class CoefficientException extends ServerException {
  CoefficientException(super.errorModel);
}

class ValidationErrorException extends ServerException {
  ValidationErrorException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

void handleDioException(DioException e) {
  if (e.response?.data is! Map<String, dynamic>) {
    throw UnknownException(
      ErrorModel(
        message: "Unexpected error",
        statusCode: 500,
        error: {},
        stack: e.toString(),
      ),
    );
  }

  final errorData = ErrorModel.fromJson(e.response!.data);

  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(errorData);

    case DioExceptionType.badCertificate:
      throw BadCertificateException(errorData);

    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(errorData);

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(errorData);

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(errorData);

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw BadResponseException(errorData);
        case 401:
          throw UnauthorizedException(errorData);
        case 403:
          throw ForbiddenException(errorData);
        case 404:
          throw NotFoundException(errorData);
        case 409:
          throw CoefficientException(errorData);
        case 422:
          throw ValidationErrorException(errorData);
        case 504:
          throw BadResponseException(
            ErrorModel(
              message: "Gateway Timeout",
              statusCode: 504,
              error: {},
              stack: '',
            ),
          );
        default:
          throw UnknownException(errorData);
      }

    case DioExceptionType.cancel:
      throw CancelException(errorData);

    case DioExceptionType.unknown:
      throw UnknownException(errorData);
  }
}

ApiResult<String> handleConnectionError() {
  final String errorMessage = 'error.networkError'.tr();

  ToastManager.showCustomToast(
    message: errorMessage,
    backgroundColor: AppColors.redColor200,
    icon: Icons.wifi_off,
    duration: const Duration(seconds: 3),
  );

  return ApiResult.failure(FailureException(errMessage: errorMessage));
}

void handleApiError(Map<String, dynamic> response) {
  String message = response['message'] ?? 'An unknown error occurred';

  if (response.containsKey('errors') && response['errors'] is Map) {
    String errors = response['errors'].values.join("\n");

    ToastManager.showCustomToast(
      message: errors.isNotEmpty ? errors : 'Unknown validation error',
      backgroundColor: AppColors.redColor200,
      icon: Icons.error_outline,
      duration: const Duration(seconds: 3),
    );

    throw FailureException(errMessage: errors);
  }

  ToastManager.showCustomToast(
    message: message.isNotEmpty ? message : 'An unknown error occurred',
    backgroundColor: AppColors.redColor200,
    icon: Icons.error_outline,
    duration: const Duration(seconds: 3),
  );

  throw FailureException(errMessage: message);
}
