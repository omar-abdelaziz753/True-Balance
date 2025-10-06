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
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/drop_down/custom_drop_down_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/verify_otp_screen.dart';

class ResisterFormWidget extends StatelessWidget {
  const ResisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.formKey,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: AppColors.neutralColor100,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius + 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'name'.tr(),
              style: Styles.contentEmphasis
                  .copyWith(color: AppColors.neutralColor1000),
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: cubit.nameController,
              keyboardType: TextInputType.text,
              hintText: 'enterYourName'.tr(),
              hintStyle: Styles.captionRegular
                  .copyWith(color: AppColors.neutralColor600),
              borderColor: AppColors.neutralColor600,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'nameRequired'.tr();
                } else if (value.trim().length < 2) {
                  return 'nameTooShort'.tr();
                }
                return null;
              },
            ),
            18.verticalSpace,
            Text('email'.tr(),
                style: Styles.contentEmphasis
                    .copyWith(color: AppColors.neutralColor1000)),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: cubit.emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'enterYourEmail'.tr(),
              hintStyle: Styles.captionRegular
                  .copyWith(color: AppColors.neutralColor600),
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
            18.verticalSpace,
            Text('phoneNumberOnly'.tr(),
                style: Styles.contentEmphasis
                    .copyWith(color: AppColors.neutralColor1000)),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: cubit.phoneController,
              keyboardType: TextInputType.phone,
              hintText: 'enterYourPhoneNumber'.tr(),
              hintStyle: Styles.captionRegular
                  .copyWith(color: AppColors.neutralColor600),
              borderColor: AppColors.neutralColor600,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'phoneRequired'.tr();
                } else if (!RegExp(r'^\+?\d{9,15}$').hasMatch(value.trim())) {
                  return 'phoneInvalid'.tr();
                }
                return null;
              },
            ),
            18.verticalSpace,

            Text(
              'gender'.tr(),
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            8.verticalSpace,
            CustomDropdownButtonWidget(
              hint: 'enterYourGender'.tr(),
              items: ['male', 'female'],
              isString: true,
              value: cubit.genderController.text.isNotEmpty
                  ? cubit.genderController.text
                  : null,
              onChanged: (value) {
                cubit.genderController.text = value ?? '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'genderRequired'.tr();
                }
                return null;
              },
            ),
            18.verticalSpace,
            Text(
              'age'.tr(),
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: cubit.ageController,
              keyboardType: TextInputType.number,
              hintText: 'enterYourAge'.tr(),
              hintStyle: Styles.captionRegular
                  .copyWith(color: AppColors.neutralColor600),
              borderColor: AppColors.neutralColor600,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'ageRequired'.tr();
                } else if (int.tryParse(value) == null) {
                  return 'ageInvalid'.tr();
                }
                return null;
              },
            ),
            18.verticalSpace,
            Text('password'.tr(),
                style: Styles.contentEmphasis
                    .copyWith(color: AppColors.neutralColor1000)),
            8.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is TogglePasswordState,
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
            32.verticalSpace,
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  // context.pushNamed(
                  //   Routes.verifyOtpScreen,
                  //   arguments: ,
                  // );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return BlocProvider.value(
                      // create: (context) => SubjectBloc(),
                      value: cubit,
                      child: VerifyOtpScreen(data: {
                        'email': cubit.emailController.text.trim(),
                        'screenName': 'Register',
                      }),
                    );
                  }));
                }
              },
              child: CustomButtonWidget(
                text: 'next'.tr(),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                textStyle: Styles.captionEmphasis
                    .copyWith(color: AppColors.neutralColor100),
                onPressed: () {
                  cubit.verificationCodeController.clear();
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.userRegister(isOtp: true);
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'alreadyHaveAccount'.tr(),
                  style: Styles.captionEmphasis
                      .copyWith(color: AppColors.neutralColor300),
                ),
                TextButton(
                  onPressed: () => context.pushNamed(Routes.loginScreen),
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.only(left: 6.w, top: 18.w, bottom: 18.w),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: AppColors.primaryColor200,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'login'.tr(),
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
                              'assets/images/svg/sign_up_icon.svg')),
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
