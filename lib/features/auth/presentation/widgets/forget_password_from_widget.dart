import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/verify_otp_screen.dart';

class ForgetPasswordFormWidget extends StatelessWidget {
  const ForgetPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: AppConstants.screenHeight(context) / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'email'.tr(),
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  8.verticalSpace,
                  CustomTextFormFieldWidget(
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'enterYourEmail'.tr(),
                    hintStyle: Styles.captionRegular.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                    borderColor: AppColors.neutralColor600,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'emailRequired'.tr();
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value.trim())) {
                        return 'emailInvalid'.tr();
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            32.verticalSpace,
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: VerifyOtpScreen(data: {
                          'email': cubit.emailController.text.trim(),
                          'screenName': 'forgetPassword',
                        }),
                      );
                    }),
                  );

                  // context.pushNamed(
                  //   Routes.verifyOtpScreen,
                  //   arguments: {
                  //     'email': cubit.emailController.text.trim(),
                  //     'screenName': 'forgetPassword',
                  //   },
                  // );
                }
              },
              child: CustomButtonWidget(
                text: 'next'.tr(),
                padding: EdgeInsets.symmetric(
                  vertical: 14.h,
                ),
                textStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor100,
                ),
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.forgetPassword();
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dontHaveAccount'.tr(),
                  style: Styles.captionEmphasis.copyWith(
                    color: AppColors.neutralColor300,
                  ),
                ),
                TextButton(
                  onPressed: () => context.pushNamed(Routes.registerScreen),
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
      ),
    );
  }
}
