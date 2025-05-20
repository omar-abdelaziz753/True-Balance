import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';

class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 130.sp,
                color: AppColors.redColor200,
              ),
              20.verticalSpace,
              Text(
                "serverError".tr(),
                style: Styles.heading3,
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              Text(
                "Please try again later or contact support.".tr(),
                style: Styles.featureStandard.copyWith(
                  color: AppColors.neutralColor600,
                ),
                textAlign: TextAlign.center,
              ),
              30.verticalSpace,
              CustomButtonWidget(
                width: double.infinity,
                text: "Back to the home page".tr(),
                color: AppColors.primaryColor700,
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.mainLayoutScreen,
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
