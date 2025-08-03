import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/auth/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/auth/data/models/user_data_model.dart';

class AuthRepository {
  final AuthApiServices authApiServices;

  AuthRepository(this.authApiServices);

  /// login
  Future<ApiResult<String>> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await authApiServices.login(
      email: email,
      password: password,
    );

    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        UserDataModel model = UserDataModel.fromJson(response.data);

        await saveCaches(model);

        customToast(
          msg: 'Login Success',
          color: Colors.green,
        );

        return const ApiResult.success('Login Success');
      } else {
        final rawError = response.data?['error'] ?? 'Login Failed';
        final errorMessage = rawError.toString().split('.').last;

        customToast(
          msg: errorMessage,
          color: Colors.red,
        );
        // return ApiResult.failure(
        //   ServerException.fromResponse(response.statusCode, response),
        // );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.message);
      }
    }

    return ApiResult.failure(
        FailureException(errMessage: 'Unexpected error occurred'));
  }

  Future<void> saveCaches(UserDataModel model) async {
    await CacheHelper.saveSecuredString(
        key: CacheKeys.userToken, value: model.data.token);
    await CacheHelper.saveData(key: CacheKeys.userName, value: model.data.name);

    AppConstants.userToken =
        await CacheHelper.getSecuredString(key: CacheKeys.userToken);
  }

  /// Register

  Future<ApiResult<String>> userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String rePassword,
    String? verificationCode,
    required String location,
  }) async {
    final response = await authApiServices.register(
      name: name,
      phone: phone,
      email: email,
      password: password,
      rePassword: rePassword,
      verificationCode: verificationCode,
      location: location,
    );
    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        if (verificationCode == null) {
          customToast(
              msg: response.data["data"]["verification_code"].toString(),
              color: AppColors.primaryColor400);
        } else {
          UserDataModel model = UserDataModel.fromJson(response.data);

          await saveCaches(model);

          customToast(msg: model.status, color: Colors.green);
        }

        return const ApiResult.success('Register Success');
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
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
        FailureException(errMessage: 'Unexpected error occurred'));
  }

  /// forgetPassword

  Future<ApiResult<String>> forgetPassword({
    required String email,
  }) async {
    final response = await authApiServices.forgetPassword(
      email: email,
    );

    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        customToast(
            msg: response.data["data"]["verification_code"].toString(),
            color: AppColors.primaryColor400);
        return const ApiResult.success('Email sent successfully');
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.error);
      }
      return ApiResult.failure(
        ServerException.fromResponse(e.response!.statusCode, e.response!),
      );
    }
  }

  /// verfiy code
  Future<ApiResult<String>> verfiyCode({
    required String password,
    required String verificationCode,
    required String passwordConfirm,
  }) async {
    final response = await authApiServices.verfiyCode(
      password: password,
      verificationCode: verificationCode,
      passwordConfirm: passwordConfirm,
    );

    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        return const ApiResult.success('Verification Success');
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.error);
      }
      return ApiResult.failure(
        ServerException.fromResponse(e.response!.statusCode, e.response!),
      );
    }
  }

  /// logout
  Future<ApiResult<String>> logout() async {
    final response = await authApiServices.logout();

    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        AppConstants.userToken = null;
        await CacheHelper.clearAllSecuredData();
        return const ApiResult.success('Logout Success');
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
        );
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.error);
      }
      return ApiResult.failure(
        ServerException.fromResponse(e.response!.statusCode, e.response!),
      );
    }
  }
}
