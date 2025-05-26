import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/helper_functions/validation.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text/custom_text_rich_widget.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpWidgetWidget extends StatelessWidget {
  const VerifyOtpWidgetWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  // final String screenName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 23.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: AppConstants.screenHeight(context) / 3,
            child: Column(
              children: [
                /// OTP Fields
                Pinput(
                  controller: TextEditingController(),
                  length: 4,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  pinAnimationType: PinAnimationType.fade,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  onChanged: (pin) {},
                  onCompleted: (pin) {},
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 51.h,
                    textStyle: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.neutralColor200),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50.w,
                    height: 51.h,
                    textStyle: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor900),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius,
                      ),
                    ),
                  ),
                  validator: (pin) => AppValidator.validateOTP(pin),
                  errorPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.redColor100),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius,
                      ),
                    ),
                  ),
                  errorText: 'Error',
                  errorTextStyle: Styles.contentEmphasis.copyWith(
                    color: AppColors.redColor100,
                  ),
                ),
                18.verticalSpace,

                CustomRichText(
                  text1: "The Code Will Expire ",
                  textStyle1: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  text2: "(02m 00s)",
                  textStyle2: Styles.captionRegular.copyWith(
                    color: AppColors.primaryColor900,
                  ),
                  text3: " Resend",
                  textStyle3: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                  onTap3: () {
                    /// ======= Resend OTP ======= ///
                  },
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          32.verticalSpace,
          CustomButtonWidget(
            text: data['screenName'] == 'forgetPassword' ? 'Verify' : 'Next',
            padding: EdgeInsets.symmetric(
              vertical: 14.h,
            ),
            textStyle: Styles.captionEmphasis.copyWith(
              color: AppColors.neutralColor100,
            ),
            onPressed: () {
              if (data['screenName'] == 'forgetPassword') {
                context.pushNamed(Routes.createNewPasswordScreen,
                    arguments: data['email']);
              } else {
                showChangePasswordBottomSheet(
                  context,
                  title1: "Congratulation!",
                  title2: "your password has been changed",
                  description:
                      "Your password has been updated. Login to continue.",
                  buttonText: "Login",
                  onPressed: () {
                    context.pushNamed(Routes.loginScreen);
                  }
                );
              }
            },
          ),
          if (data['screenName'] == 'forgetPassword')
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: Styles.captionEmphasis.copyWith(
                    color: AppColors.neutralColor300,
                  ),
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: 6.w,
                        top: 18.w,
                        bottom: 18.w,
                        // right: 10.w,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.primaryColor200),
                  child: Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: Styles.captionEmphasis.copyWith(
                          color: AppColors.primaryColor900,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5.w,
                          decorationColor: AppColors.primaryColor900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/svg/sign_up_icon.svg',
                      )
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
