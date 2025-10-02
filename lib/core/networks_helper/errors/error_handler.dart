import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/error_screens/server/server_error_scereen.dart';
import 'package:truee_balance_app/features/error_screens/unauth/un_auth_screen.dart';

class ErrorHandler {
  /// Handles API errors from the server
  static FailureException handleApiError(Response? response) {
    String message = "error.unknown".tr();
    print(response);
    if (response == null) {
      message = "error.noResponse".tr();
    } else if (response.statusCode == 401) {
      print("this");
      _navigateToUnAuthScreen();
      message = "error.sessionExpired".tr();
    } else if (response.statusCode! >= 500) {
      _navigateToServerErrorScreen();
      message = "error.serverError".tr();
    } else if (response.data != null && response.data is Map<String, dynamic>) {
      final responseMessage = response.data['message'];
      final errors = response.data['errors'];

      if (responseMessage == "error.wrongVerification".tr() &&
          errors is Map<String, dynamic>) {
        message = _mapValidationErrors(errors);
      } else {
        message = responseMessage ?? "error.unexpected".tr();
      }
    } else {
      message = "error.unexpectedResponse".tr();
    }

    _showToast(message, isError: true);
    return FailureException(errMessage: message);
  }

  /// Maps validation errors into a readable string
  static String _mapValidationErrors(Map<String, dynamic> errors) {
    return errors.values.map((value) => "- $value").join("\n");
  }

  /// Handles all Dio-related errors
  static FailureException handleDioError(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionError:
        errorMessage = "error.noConnection".tr();
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "error.requestTimeout".tr();
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "error.serverTimeout".tr();
        break;
      case DioExceptionType.badResponse:
        return handleApiError(e.response);
      case DioExceptionType.cancel:
        errorMessage = "error.requestCancelled".tr();
        break;
      case DioExceptionType.unknown:
        errorMessage = "error.network".tr();
        break;
      default:
        errorMessage = "error.connection".tr();
    }

    _showToast(errorMessage, isError: true);
    return FailureException(errMessage: errorMessage);
  }

  /// Handles unexpected errors (null values, logic errors, etc.)
  static FailureException handleUnexpectedError(Object e) {
    String errorMessage = "${'error.unexpectedError'.tr()}${e.toString()}";
    _showToast(errorMessage, isError: true);
    return FailureException(errMessage: errorMessage);
  }

  /// Shows toast messages
  static void _showToast(String message, {bool isError = false}) {
    ToastManager.showCustomToast(
      message: message,
      backgroundColor:
          isError ? AppColors.redColor200 : AppColors.greenColor200,
      icon: isError ? Icons.error_outline : Icons.check_circle_outline,
      duration: const Duration(seconds: 3),
    );
  }

  /// Navigate to Unauthorized Screen when status is 401
  static void _navigateToUnAuthScreen() {
    final context = AppConstants.navigatorKey.currentState?.context;
    if (context != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const UnauthorizedScreen()),
        (route) => false,
      );
    }
  }

  /// Navigate to Server Error Screen when status is 500
  static void _navigateToServerErrorScreen() {
    final context = AppConstants.navigatorKey.currentState?.context;
    if (context != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const ServerErrorScreen()), // Navigate to Server Error Screen
        (route) => false,
      );
    }
  }
}
