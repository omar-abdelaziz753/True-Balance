import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';

class UnauthorizedScreen extends StatelessWidget {
  const UnauthorizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 130.sp,
                color: AppColors.redColor200,
              ),
              20.verticalSpace,
              Text(
                "Session has expired".tr(),
                style: Styles.heading3,
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              Text(
                "Please log in again to access your account.".tr(),
                style: Styles.featureStandard.copyWith(
                  color: AppColors.neutralColor600,
                ),
                textAlign: TextAlign.center,
              ),
              30.verticalSpace,
              CustomButtonWidget(
                width: double.infinity,
                text: "Back Login".tr(),
                color: AppColors.primaryColor700,
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginScreen,
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
