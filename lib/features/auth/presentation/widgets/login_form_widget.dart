import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 18.h,
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
              'phoneNumber'.tr(),
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: context.read<AuthCubit>().emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'enterYourPhoneNumber'.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'phoneNumberIsRequired'.tr();
                }
                return null;
              },
              hintStyle: Styles.captionRegular.copyWith(
                color: AppColors.neutralColor600,
              ),
              borderColor: AppColors.neutralColor600,
            ),
            18.verticalSpace,
            Text(
              'password'.tr(),
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            8.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is TogglePasswordState,
              builder: (context, state) {
                return CustomTextFormFieldWidget(
                  controller: context.read<AuthCubit>().passwordController,
                  obscureText: context.read<AuthCubit>().isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'enterYourPassword'.tr(),
                  hintStyle: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'passwordIsRequired'.tr();
                    }
                    return null;
                  },
                  borderColor: AppColors.neutralColor600,
                  suffixIcon: IconButton(
                    onPressed: () => context.read<AuthCubit>().toggleObscure(),
                    icon: context.read<AuthCubit>().isObscure
                        ? Icon(
                            Iconsax.eye,
                            color: AppColors.neutralColor600,
                          )
                        : Icon(
                            Iconsax.eye_slash,
                            color: AppColors.neutralColor600,
                          ),
                  ),
                );
              },
            ),
            // 12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: 6.w,
                        top: 12.w,
                        bottom: 10.w,
                        // right: 10.w,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.primaryColor200),
                  onPressed: () =>
                      context.pushNamed(Routes.forgetPasswordScreen),
                  child: Text(
                    'forgotPassword'.tr(),
                    style: Styles.captionRegular.copyWith(
                      color: AppColors.primaryColor900,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5.w,
                      decorationColor: AppColors.primaryColor900,
                    ),
                  ),
                ),
              ],
            ),
            23.verticalSpace,
            CustomButtonWidget(
              text: 'login'.tr(),
              padding: EdgeInsets.symmetric(
                vertical: 14.h,
              ),
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
              onPressed: () => {
                if (context.read<AuthCubit>().formKey.currentState!.validate())
                  {context.read<AuthCubit>().userLogin()}
              },
            ),
            // 18.verticalSpace,
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
                      Transform(
                        alignment: Alignment.center,
                        transform: context.locale.languageCode == "ar"
                            ? Matrix4.rotationY(3.1416) // قلب 180 درجة
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
