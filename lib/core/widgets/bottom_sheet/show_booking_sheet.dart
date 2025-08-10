import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';

void showbookingBottomSheet(
  BuildContext context, {
  required String title1,
  required String title2,
  required String description,
  required String buttonText,
  required VoidCallback onPressed,
}) {
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
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
                          text: title1,
                          style: Styles.highlightAccent.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor800,
                          )),
                      TextSpan(
                        text: title2,
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
                  description,
                  textAlign: TextAlign.center,
                  style: Styles.captionEmphasis.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.neutralColor600,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  onPressed: onPressed,
                  text: buttonText,
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
