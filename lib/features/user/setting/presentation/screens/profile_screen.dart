// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/core/themes/text_colors.dart';
// import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
// import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
// import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
// import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';
// import 'package:truee_balance_app/features/user/setting/presentation/widgets/profile_image_widget.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor900,
//       appBar: CustomBasicAppBar(
//         leading: BackButton(
//           color: AppColors.neutralColor100,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: 'accountInformation'.tr(),
//         backgroundColor: AppColors.primaryColor900,
//         svgAsset: 'assets/images/svg/bg_image.svg',
//       ),
//       body: BlocBuilder<SettingsCubit, SettingsState>(
//         builder: (context, state) {
//           final cubit = context.read<SettingsCubit>();

//           return Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(18.sp),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12.r),
//                 topRight: Radius.circular(12.r),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         18.verticalSpace,
//                         ProfileImageWidget(cubit: cubit),
//                         10.verticalSpace,
//                         Text(
//                           cubit.getProfileDataModel == null
//                               ? 'Loading...'.tr()
//                               : cubit.getProfileDataModel!.data!.name!,
//                           style: Styles.highlightEmphasis.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                         ),
//                         18.verticalSpace,
//                         Row(
//                           children: [
//                             Text(
//                               'fullName'.tr(),
//                               style: Styles.contentEmphasis.copyWith(
//                                 color: AppColors.neutralColor1000,
//                               ),
//                             ),
//                           ],
//                         ),
//                         8.verticalSpace,
//                         CustomTextFormFieldWidget(
//                           controller: cubit.fullNameController,
//                           hintText: cubit.getProfileDataModel == null
//                               ? 'Loading...'.tr()
//                               : cubit.getProfileDataModel!.data!.name!,
//                           keyboardType: TextInputType.name,
//                           borderColor: AppColors.neutralColor1000,
//                           hintStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                           textStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                           validator: (value) {
//                             return null;
//                           },
//                         ),
//                         18.verticalSpace,
//                         Row(
//                           children: [
//                             Text(
//                               'phoneNumberOnly'.tr(),
//                               style: Styles.contentEmphasis.copyWith(
//                                 color: AppColors.neutralColor1000,
//                               ),
//                             ),
//                           ],
//                         ),
//                         8.verticalSpace,
//                         CustomTextFormFieldWidget(
//                           controller: cubit.phoneController,
//                           hintText: cubit.getProfileDataModel == null
//                               ? 'Loading...'.tr()
//                               : cubit.getProfileDataModel!.data!.phone!,
//                           keyboardType: TextInputType.number,
//                           borderColor: AppColors.neutralColor1000,
//                           hintStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),

//                           textStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                           validator: (value) {
//                             return
//                           },
//                         ),
//                         18.verticalSpace,
//                         Row(
//                           children: [
//                             Text(
//                               'emailOnly'.tr(),
//                               style: Styles.contentEmphasis.copyWith(
//                                 color: AppColors.neutralColor1000,
//                               ),
//                             ),
//                           ],
//                         ),
//                         8.verticalSpace,
//                         CustomTextFormFieldWidget(
//                           controller: cubit.emailController,
//                           hintText: cubit.getProfileDataModel == null
//                               ? 'Loading...'.tr()
//                               : cubit.getProfileDataModel!.data!.email!,
//                           keyboardType: TextInputType.emailAddress,
//                           borderColor: AppColors.neutralColor1000,
//                           hintStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                           textStyle: Styles.captionRegular.copyWith(
//                             color: AppColors.neutralColor1000,
//                           ),
//                           validator: (value) {
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 BlocConsumer<SettingsCubit, SettingsState>(
//                   listener: (context, state) {
//                     if (state is UpdateProfileDataSuccessState) {
//                       context.read<SettingsCubit>().getProfileData();
//                       context.pop();
//                     }
//                   },
//                   builder: (context, state) {
//                     return Padding(
//                       padding: EdgeInsets.only(bottom: 20.h),
//                       child: CustomButtonWidget(
//                         onPressed: () {
//                           cubit.updateProfileData();
//                         },
//                         color: AppColors.primaryColor900,
//                         text: 'editProfile'.tr(),
//                         textStyle: Styles.captionEmphasis.copyWith(
//                           color: AppColors.neutralColor100,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/drop_down/custom_drop_down_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';
import 'package:truee_balance_app/features/user/setting/presentation/widgets/profile_image_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'accountInformation'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();

          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: ProfileImageWidget(cubit: cubit)),
                          10.verticalSpace,
                          Center(
                            child: Text(
                              cubit.getProfileDataModel == null
                                  ? 'Loading...'.tr()
                                  : cubit.getProfileDataModel!.data!.name!,
                              style: Styles.highlightEmphasis.copyWith(
                                color: AppColors.neutralColor1000,
                              ),
                            ),
                          ),
                          13.verticalSpace,

                          /// Full Name

                          Text(
                            'fullName'.tr(),
                            style: Styles.contentEmphasis.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                          ),

                          8.verticalSpace,
                          CustomTextFormFieldWidget(
                            controller: cubit.fullNameController,
                            hintText: cubit.getProfileDataModel == null
                                ? 'Loading...'.tr()
                                : cubit.getProfileDataModel!.data!.name!,
                            keyboardType: TextInputType.name,
                            borderColor: AppColors.neutralColor1000,
                            hintStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            textStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'fullNameRequired'.tr();
                              }
                              if (value.trim().length < 3) {
                                return 'fullNameTooShort'.tr();
                              }
                              return null;
                            },
                          ),

                          13.verticalSpace,

                          /// Phone Number

                          Text(
                            'phoneNumberOnly'.tr(),
                            style: Styles.contentEmphasis.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                          ),

                          8.verticalSpace,
                          CustomTextFormFieldWidget(
                            controller: cubit.phoneController,
                            hintText: cubit.getProfileDataModel == null
                                ? 'Loading...'.tr()
                                : cubit.getProfileDataModel!.data!.phone!,
                            keyboardType: TextInputType.phone,
                            borderColor: AppColors.neutralColor1000,
                            hintStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            textStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'phoneRequired'.tr();
                              }
                              final phoneRegExp =
                                  RegExp(r'^[0-9]{8,15}$'); // basic check
                              if (!phoneRegExp.hasMatch(value)) {
                                return 'invalidPhone'.tr();
                              }
                              return null;
                            },
                          ),

                          13.verticalSpace,

                          /// Email

                          Text(
                            'emailOnly'.tr(),
                            style: Styles.contentEmphasis.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                          ),

                          8.verticalSpace,
                          CustomTextFormFieldWidget(
                            controller: cubit.emailController,
                            hintText: cubit.getProfileDataModel == null
                                ? 'Loading...'.tr()
                                : cubit.getProfileDataModel!.data!.email!,
                            keyboardType: TextInputType.emailAddress,
                            borderColor: AppColors.neutralColor1000,
                            hintStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            textStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'emailRequired'.tr();
                              }
                              final emailRegExp =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegExp.hasMatch(value)) {
                                return 'invalidEmail'.tr();
                              }
                              return null;
                            },
                          ),
                          13.verticalSpace,

                          Text(
                            "age".tr(),
                            style: Styles.contentEmphasis.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                          ),

                          8.verticalSpace,
                          CustomTextFormFieldWidget(
                            controller: cubit.ageController,
                            hintText: cubit.getProfileDataModel == null
                                ? 'Loading...'.tr()
                                : cubit.getProfileDataModel!.data!.age != null
                                    ? cubit.getProfileDataModel!.data!.age
                                        .toString()
                                    : "age".tr(),
                            keyboardType: TextInputType.number,
                            borderColor: AppColors.neutralColor1000,
                            hintStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            textStyle: Styles.captionRegular.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'ageRequired'.tr();
                              }
                              return null;
                            },
                          ),

                          13.verticalSpace,

                          Text(
                            "gender".tr(),
                            style: Styles.contentEmphasis.copyWith(
                              color: AppColors.neutralColor1000,
                            ),
                          ),
                          8.verticalSpace,
                          CustomDropdownButtonWidget(
                            hint: cubit.genderController.text.isNotEmpty
                                ? cubit.genderController.text
                                : (cubit.getProfileDataModel?.data?.gender
                                            ?.isNotEmpty ??
                                        false)
                                    ? cubit.getProfileDataModel!.data!.gender!
                                    : "gender".tr(),
                            items: ['male', 'female'],
                            isString: true,
                            value: cubit.genderController.text.isNotEmpty
                                ? cubit.genderController.text
                                : (cubit.getProfileDataModel?.data?.gender
                                            ?.isNotEmpty ??
                                        false)
                                    ? cubit.getProfileDataModel!.data!.gender!
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
                        ],
                      ),
                    ),
                  ),
                ),

                /// Save Button
                BlocConsumer<SettingsCubit, SettingsState>(
                  listener: (context, state) {
                    if (state is UpdateProfileDataSuccessState) {
                      context.read<SettingsCubit>().getProfileData();
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CustomButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.updateProfileData();
                          }
                        },
                        color: AppColors.primaryColor900,
                        text: 'editProfile'.tr(),
                        textStyle: Styles.captionEmphasis.copyWith(
                          color: AppColors.neutralColor100,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
