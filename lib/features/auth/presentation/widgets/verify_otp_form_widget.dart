import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text/custom_text_rich_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/create_new_password_screen.dart';

class VerifyOtpWidgetWidget extends StatefulWidget {
  const VerifyOtpWidgetWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<VerifyOtpWidgetWidget> createState() => _VerifyOtpWidgetWidgetState();
}

class _VerifyOtpWidgetWidgetState extends State<VerifyOtpWidgetWidget> {
  int _resendKey = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final formKey = GlobalKey<FormState>();

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
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: AppConstants.screenHeight(context) / 3,
              child: Column(
                children: [
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
                        return 'enterYourCodeComplete'.tr();
                      }
                      return null;
                    },
                    errorTextStyle: Styles.contentEmphasis.copyWith(
                      color: AppColors.redColor100,
                    ),
                  ),
                  18.verticalSpace,
                  // StreamBuilder<String>(
                  //   stream: countdownStream(const Duration(minutes: 2)),
                  //   builder: (context, snapshot) {
                  //     final timerText = snapshot.data ?? "(02 m 00 s)";
                  //
                  //     return CustomRichText(
                  //       text1: "theCodeWillExpire".tr(),
                  //       textStyle1: Styles.captionRegular.copyWith(
                  //         color: AppColors.neutralColor1000,
                  //       ),
                  //       text2: timerText,
                  //       textStyle2: Styles.captionRegular.copyWith(
                  //         color: AppColors.primaryColor900,
                  //       ),
                  //       text3: "resend".tr(),
                  //       textStyle3: Styles.captionRegular.copyWith(
                  //         color: AppColors.neutralColor600,
                  //       ),
                  //       onTap3: () {
                  //         // cubit.userRegister(isOtp: false);
                  //       },
                  //       textAlign: TextAlign.center,
                  //     );
                  //   },
                  // )
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is ResendPasswordLoadingState) {
                        setState(() {
                          _resendKey++; // هنغير المفتاح عشان الـ StreamBuilder يتبني من جديد
                        });
                      }
                    },
                    child: StreamBuilder<String>(
                      key: ValueKey(_resendKey),
                      stream: countdownStream(const Duration(minutes: 2)),
                      builder: (context, snapshot) {
                        final timerText = snapshot.data ?? "(02 m 00 s)";

                        final isTimerFinished = timerText
                                .contains("00 m 00 s") ||
                            snapshot.connectionState == ConnectionState.done;

                        return CustomRichText(
                          text1: "theCodeWillExpire".tr(),
                          textStyle1: Styles.captionRegular.copyWith(
                            color: AppColors.neutralColor1000,
                          ),
                          text2: timerText,
                          textStyle2: Styles.captionRegular.copyWith(
                            color: AppColors.primaryColor900,
                          ),
                          text3: "resend".tr(),
                          textStyle3: Styles.captionRegular.copyWith(
                            color: isTimerFinished
                                ? AppColors.primaryColor700
                                : AppColors.neutralColor600,
                          ),
                          onTap3: isTimerFinished
                              ? () {
                                  // cubit.userRegister(isOtp: false);
                                  cubit.forgetPassword(
                                      email: widget.data['email'],
                                      isOtp: false);
                                }
                              : null,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
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
                if (state is Otp2SuccessState) {
                  showChangePasswordBottomSheet(context,
                      title1: "congratulation".tr(),
                      title2: "yourPasswordHasBeenChanged".tr(),
                      description: "loginToContinue".tr(),
                      buttonText: "login".tr(), onPressed: () {
                    context.pushNamedAndRemoveUntil(Routes.loginScreen);
                  });
                }
                if (state is VerfiyCodeSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: CreateNewPasswordScreen(
                          data: {
                            'type':
                                CacheHelper.getData(key: CacheKeys.typeInOTP),
                            'token':
                                CacheHelper.getData(key: CacheKeys.tokenInOTP),
                          },
                        ),
                      );
                    }),
                  );
                }
              },
              child: CustomButtonWidget(
                text: widget.data['screenName'] == 'forgetPassword'
                    ? 'verify'.tr()
                    : 'next'.tr(),
                padding: EdgeInsets.symmetric(
                  vertical: 14.h,
                ),
                textStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor100,
                ),
                onPressed: () {
                  if (widget.data['screenName'] == 'forgetPassword') {
                    cubit.verifyOTP();
                  } else {
                    // cubit.userRegister();
                    if (formKey.currentState!.validate()) {
                      cubit.userRegister();
                    } else {
                      customToast(
                          msg: "please enter the otp code",
                          color: AppColors.greenColor100);
                    }
                  }
                },
              ),
            ),
            if (widget.data['screenName'] == 'forgetPassword')
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
                        Transform(
                          alignment: Alignment.center,
                          transform: context.locale.languageCode == "ar"
                              ? Matrix4.rotationY(3.1416)
                              : Matrix4.identity(),
                          child: SvgPicture.asset(
                            'assets/images/svg/sign_up_icon.svg',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

Stream<String> countdownStream(Duration duration) async* {
  int totalSeconds = duration.inSeconds;

  while (totalSeconds >= 0) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    yield "($minutes m $seconds s)";
    await Future.delayed(const Duration(seconds: 1));
    totalSeconds--;
  }
}
