import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/helper_functions/validation.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';

class CreateNewPasswordFormWidget extends StatelessWidget {
  const CreateNewPasswordFormWidget({super.key});

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
          children: [
            SizedBox(
              width: double.infinity,
              height: AppConstants.screenHeight(context) / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'newPassword'.tr(),
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  8.verticalSpace,
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) =>
                        current is TogglePasswordState,
                    builder: (context, state) {
                      return CustomTextFormFieldWidget(
                        controller: cubit.passwordController,
                        obscureText: cubit.isObscure,
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
                          onPressed: () => cubit.toggleObscure(),
                          icon: cubit.isObscure
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
                  18.verticalSpace,
                  Text(
                    'confirmNewPassword'.tr(),
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  8.verticalSpace,
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) =>
                        current is TogglePasswordState2,
                    builder: (context, state) {
                      return CustomTextFormFieldWidget(
                        controller: cubit.rePasswordController,
                        obscureText: context.read<AuthCubit>().isObscure2,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'enterYourConfirmNewPassword'.tr(),
                        hintStyle: Styles.captionRegular.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                        validator: (value) =>
                            AppValidator.validateConfirmPassword(
                                cubit.passwordController.text,
                                cubit.rePasswordController.text),
                        // validator: (value) {
                        //    AppValidator.validateConfirmPassword(
                        //       cubit.passwordController.text,
                        //       cubit.rePasswordController.text);
                        // },
                        borderColor: AppColors.neutralColor600,
                        suffixIcon: IconButton(
                          onPressed: () => cubit.toggleObscure2(),
                          icon: cubit.isObscure2
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
                  18.verticalSpace,
                ],
              ),
            ),
            32.verticalSpace,
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is CreateNewPasswordSuccessState) {
                  showChangePasswordBottomSheet(context,
                      title1: "congratulation".tr(),
                      title2: "yourPasswordHasBeenChanged".tr(),
                      description: "loginToContinue".tr(),
                      buttonText: "login".tr(), onPressed: () {
                    context.pushNamedAndRemoveUntil(Routes.loginScreen);
                  });
                }
              },
              child: CustomButtonWidget(
                text: 'submit'.tr(),
                padding: EdgeInsets.symmetric(
                  vertical: 14.h,
                ),
                textStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor100,
                ),
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.createNewPassword();
                    // print('OOOOO');
                  }
                },
              ),
            ),
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
