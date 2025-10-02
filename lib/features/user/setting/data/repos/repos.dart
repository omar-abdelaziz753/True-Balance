import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/networks_helper/api_results/api_result.dart';
import 'package:truee_balance_app/core/networks_helper/errors/exceptions.dart';
import 'package:truee_balance_app/core/networks_helper/errors/failure.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/setting/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/user/setting/data/models/profile/get_profile_data_model.dart';

class SettingsRepos {
  final SettingsApiServices settingsApiServices;

  SettingsRepos(this.settingsApiServices);

  /// Get Profile Data
  Future<ApiResult<GetProfileDataModel>> getProfileData() async {
    try {
      final response = await settingsApiServices.getProfileData();

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final model = GetProfileDataModel.fromJson(response!.data);
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

  /// Update Profile Data
  // Future<ApiResult<String>> updateProfileData({
  //   String? name,
  //   String? email,
  //   String? phone,
  //   File? image,
  // }) async {
  //   try {
  //     final response = await settingsApiServices.updateProfileData(
  //       name: name,
  //       email: email,
  //       phone: phone,
  //       image: image,
  //     );

  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //       ToastManager.showCustomToast(
  //         message: response!.data['status'],
  //         backgroundColor: AppColors.primaryColor900,
  //         icon: Icons.check_circle_outline,
  //       );
  //       return ApiResult.success(response.data['status']);
  //     } else {
  //       return ApiResult.failure(
  //         ServerException.fromResponse(response?.statusCode, response),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     try {
  //       handleDioException(e);
  //     } on ServerException catch (ex) {
  //       return ApiResult.failure(ex.errorModel.message);
  //     }
  //   }

  //   return ApiResult.failure(
  //     FailureException(errMessage: 'Unexpected error occurred'),
  //   );
  // }

  /// Update Profile Data
  Future<ApiResult<String>> updateProfileData({
    String? name,
    String? email,
    String? phone,
    File? image,
  }) async {
    try {
      final response = await settingsApiServices.updateProfileData(
        name: name,
        email: email,
        phone: phone,
        image: image,
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        ToastManager.showCustomToast(
          message: response!.data['status'],
          backgroundColor: AppColors.primaryColor900,
          icon: Icons.check_circle_outline,
        );
        final profileResult = await getProfileData();
        profileResult.when(
          success: (profileModel) async {
            await CacheHelper.saveData(
              key: CacheKeys.userName,
              value: profileModel.data?.name,
            );
            await CacheHelper.saveData(
              key: CacheKeys.userEmail,
              value: profileModel.data?.email,
            );
            await CacheHelper.saveData(
              key: CacheKeys.userPhone,
              value: profileModel.data?.phone,
            );
            await CacheHelper.saveData(
              key: CacheKeys.userImage,
              value: profileModel.data?.image,  
            );
          },
          failure: (err) {
            // debugPrint("Failed to fetch updated profile data: $err");
          },
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
}
