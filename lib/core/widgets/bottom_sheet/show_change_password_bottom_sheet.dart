import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:lottie/lottie.dart';

void showChangePasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lotties/success.json',
                  width: 102.w,
                  height: 102.h,
                  fit: BoxFit.cover,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Congratulation!",
                          style: Styles.highlightAccent.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor800,
                          )),
                      TextSpan(
                        text: "your password has been changed",
                        style: Styles.highlightAccent.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Your password has been updated. Login to continue.",
                  textAlign: TextAlign.center,
                  style: Styles.captionEmphasis.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.neutralColor600,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  text: 'Login',
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                  ),
                  textStyle: Styles.captionEmphasis.copyWith(
                    color: AppColors.neutralColor100,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}
