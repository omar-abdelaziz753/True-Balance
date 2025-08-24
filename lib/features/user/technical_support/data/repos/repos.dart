import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/technical_support/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/about_us/about_us_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/privacy_policy/privacy_policy_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/all_tickets_data_model.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/tickets/ticket_details_data_model.dart';

class TechnicalSupportRepo {
  final TechnicalSupportApiServices technicalSupportApiServices;

  TechnicalSupportRepo(this.technicalSupportApiServices);

  /// Make Ticket
  Future<ApiResult<String>> makeTicket({
    required String title,
    required String priority,
  }) async {
    final response = await technicalSupportApiServices.makeTicket(
      title: title,
      priority: priority,
    );
    try {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        ToastManager.showCustomToast(
          message: response!.data['status'],
          backgroundColor: AppColors.primaryColor900,
          icon: Icons.check_circle_outline,
        );
        return ApiResult.success(response.data['status']);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Send Message
  Future<ApiResult<String>> sendMessage({
    required String ticketId,
    required String message,
  }) async {
    final response = await technicalSupportApiServices.sendMessage(
      ticketId: ticketId,
      message: message,
    );
    try {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return ApiResult.success(response!.data['status']);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Get All Tickets
  Future<ApiResult<AllTicketsDataModel>> getAllTickets(
      {required int page}) async {
    final response =
        await technicalSupportApiServices.getAllTickets(page: page);
    try {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        AllTicketsDataModel allTicketsDataModel =
            AllTicketsDataModel.fromJson(response!.data);
        return ApiResult.success(allTicketsDataModel);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Get Ticket Details
  Future<ApiResult<TicketDetailsDataModel>> getTicketDetails({
    required int ticketId,
  }) async {
    final response = await technicalSupportApiServices.getTicketDetails(
      ticketId: ticketId,
    );
    try {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        TicketDetailsDataModel ticketDetailsDataModel =
            TicketDetailsDataModel.fromJson(response!.data);
        return ApiResult.success(ticketDetailsDataModel);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Get About Us
  Future<ApiResult<AboutUsModel>> getAboutUs() async {
    try {
      final response = await technicalSupportApiServices.getAboutUs();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = AboutUsModel.fromJson(response!.data);
        return ApiResult.success(model);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

  /// Get Privacy Policy
  Future<ApiResult<PrivacyPolicyModel>> getPrivacy() async {
    try {
      final response = await technicalSupportApiServices.getPrivacy();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = PrivacyPolicyModel.fromJson(response!.data);
        return ApiResult.success(model);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }


  Future<ApiResult<PrivacyPolicyModel>> getTerms() async {
    try {
      final response = await technicalSupportApiServices.getTerms();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = PrivacyPolicyModel.fromJson(response!.data);
        return ApiResult.success(model);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }
    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }

}
