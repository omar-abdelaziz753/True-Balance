import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text/custom_text_rich_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/create_new_password_screen.dart';

class VerifyOtpWidgetWidget extends StatelessWidget {
  const VerifyOtpWidgetWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  // final String screenName;

  @override
  Widget build(BuildContext context) {
    hideLoading();
    final cubit = context.read<AuthCubit>();
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
                  controller: cubit.verificationCodeController,
                  length: 5,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  pinAnimationType: PinAnimationType.fade,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
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
                  validator: (pin) {
                    if (pin?.length != 5) {
                      return 'error'.tr();
                    }
                    return null;
                  },
                  // errorPinTheme: PinTheme(
                  //   width: 50.w,
                  //   height: 50.h,
                  //   textStyle: Styles.contentEmphasis.copyWith(
                  //     color: AppColors.neutralColor1000,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: AppColors.redColor100),
                  //     borderRadius: BorderRadius.circular(
                  //       AppConstants.borderRadius,
                  //     ),
                  //   ),
                  // ),
                  // errorText: 'error'.tr(),
                  errorTextStyle: Styles.contentEmphasis.copyWith(
                    color: AppColors.redColor100,
                  ),
                ),
                18.verticalSpace,

                CustomRichText(
                  text1: "theCodeWillExpire".tr(),
                  textStyle1: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  text2: "(02m 00s)",
                  textStyle2: Styles.captionRegular.copyWith(
                    color: AppColors.primaryColor900,
                  ),
                  text3: "resend".tr(),
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
          BlocListener<AuthCubit, AuthState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is OtpSuccessState) {
                showChangePasswordBottomSheet(context,
                    title1: "congratulation".tr(),
                    title2: "yourPasswordHasBeenChanged".tr(),
                    description: "loginToContinue".tr(),
                    buttonText: "login".tr(), onPressed: () {
                  context.pushNamed(Routes.loginScreen);
                });
              }

              // context.pushNamed(Routes.createNewPasswordScreen,
              //     arguments: data['email']);
            },
            child: CustomButtonWidget(
              text: data['screenName'] == 'forgetPassword'
                  ? 'verify'.tr()
                  : 'next'.tr(),
              padding: EdgeInsets.symmetric(
                vertical: 14.h,
              ),
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
              onPressed: () {
                if (data['screenName'] == 'forgetPassword') {
                  // cubit.verfiyCode();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: const CreateNewPasswordScreen(),
                      );
                    }),
                  );
                } else {
                  cubit.userRegister();
                }
              },
            ),
          ),
          if (data['screenName'] == 'forgetPassword')
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dontHaveAnAccount'.tr(),
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
                        'signUp'.tr(),
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
