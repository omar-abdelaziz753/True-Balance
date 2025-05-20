import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

void showLoading({
  EasyLoadingMaskType maskType = EasyLoadingMaskType.clear,
}) {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50.sp
    ..radius = AppConstants.borderRadius
    ..backgroundColor = AppColors.neutralColor100
    ..indicatorColor = AppColors.primaryColor900
    ..textColor = Colors.black
    ..maskColor = Colors.black.withValues(alpha: 0.5)
    ..userInteractions = false;

  EasyLoading.show(
    maskType: maskType,
    status: "يرجى الانتظار...",
  );
}

void hideLoading() {
  EasyLoading.dismiss();
}

void showError(String message) {
  EasyLoading.dismiss();

  EasyLoading.showError(
    message,
    dismissOnTap: true,
  );
}

void showSuccess(String message) {
  EasyLoading.dismiss();

  EasyLoading.showSuccess(
    message,
    dismissOnTap: true,
  );
}

void showInfo(String message) {
  EasyLoading.dismiss();

  EasyLoading.showInfo(
    message,
    dismissOnTap: true,
  );
}
