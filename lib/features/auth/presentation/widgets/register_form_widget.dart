import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';

class ResisterFormWidget extends StatelessWidget {
  const ResisterFormWidget({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          8.verticalSpace,
          CustomTextFormFieldWidget(
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter Your Email',
            hintStyle: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor600,
            ),
            borderColor: AppColors.neutralColor600,
          ),
          18.verticalSpace,
          Text(
            'Phone Number',
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          8.verticalSpace,
          CustomTextFormFieldWidget(
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter your Phone Number',
            hintStyle: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor600,
            ),
            borderColor: AppColors.neutralColor600,
          ),
          18.verticalSpace,
          Text(
            'Password',
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          8.verticalSpace,
          CustomTextFormFieldWidget(
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter Your Password',
            hintStyle: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor600,
            ),
            borderColor: AppColors.neutralColor600,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.eye,
                color: AppColors.neutralColor600,
              ),
            ),
          ),
          32.verticalSpace,
          CustomButtonWidget(
            text: 'Next',
            padding: EdgeInsets.symmetric(
              vertical: 14.h,
            ),
            textStyle: Styles.captionEmphasis.copyWith(
              color: AppColors.neutralColor100,
            ),
            onPressed: () => context.pushNamed(
              Routes.verifyOtpScreen,
              arguments: {
                'email': 'Omar@gmail.com',
                'screenName': 'Register',
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
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
                      'Login',
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
