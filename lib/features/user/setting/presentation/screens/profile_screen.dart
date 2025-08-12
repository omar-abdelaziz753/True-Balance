import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                18.verticalSpace,

                GestureDetector(
                  onTap: () {
                    cubit.chooseImageFromGallery();
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 45.r,
                        backgroundColor: AppColors.neutralColor200,
                        child: cubit.profileImage != null
                            ? ClipOval(
                                child: Image.file(
                                  cubit.profileImage!,
                                  width: 90.r, // Diameter = 2 * radius
                                  height: 90.r,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(
                                    Icons.person,
                                    size: 45.r,
                                    color: AppColors.neutralColor600,
                                  ),
                                ),
                              )
                            : cubit.getProfileDataModel?.data?.image != null
                                ? ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: cubit
                                          .getProfileDataModel!.data!.image!,
                                      width: 90.r,
                                      height: 90.r,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.person,
                                        size: 45.r,
                                        color: AppColors.neutralColor600,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 45.r,
                                    color: AppColors.neutralColor600,
                                  ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.primaryColor900,
                          child: SvgPicture.asset(
                            'assets/images/svg/canera_icon.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,

                Text(
                  cubit.getProfileDataModel == null
                      ? 'Loading...'.tr()
                      : cubit.getProfileDataModel!.data!.name!,
                  style: Styles.highlightEmphasis.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                18.verticalSpace,

                /// Full Name
                Row(
                  children: [
                    Text(
                      'fullName'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                  ],
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
                  validator: (value) {},
                ),
                18.verticalSpace,

                /// Phone Number
                Row(
                  children: [
                    Text(
                      'phoneNumberOnly'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFormFieldWidget(
                  controller: cubit.phoneController,
                  hintText: cubit.getProfileDataModel == null
                      ? 'Loading...'.tr()
                      : cubit.getProfileDataModel!.data!.phone!,
                  keyboardType: TextInputType.number,
                  borderColor: AppColors.neutralColor1000,
                  hintStyle: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  textStyle: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  validator: (value) {},
                ),
                18.verticalSpace,

                /// Email
                Row(
                  children: [
                    Text(
                      'emailOnly'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                  ],
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
                  validator: (value) {},
                ),
                18.verticalSpace,

                /// Specialization
                Row(
                  children: [
                    Text(
                      'specialization'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFormFieldWidget(
                  readOnly: true,
                  hintText: cubit.getProfileDataModel == null
                      ? 'Loading...'.tr()
                      : cubit.getProfileDataModel!.data!.type!,
                  keyboardType: TextInputType.name,
                  borderColor: AppColors.neutralColor1000,
                  hintStyle: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  textStyle: Styles.captionRegular.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  validator: (value) {},
                ),
                18.verticalSpace,
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is UpdateProfileDataSuccessState) {
            context.read<SettingsCubit>().getProfileData();
          }
        },
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();

          return Container(
            height: 119.h,
            width: double.infinity,
            color: AppColors.neutralColor100,
            padding: EdgeInsets.only(
              top: 18.w,
              left: 18.w,
              right: 18.w,
              bottom: 52.w,
            ),
            child: CustomButtonWidget(
              onPressed: () {
                cubit.updateProfileData();
              },
              color: AppColors.primaryColor900,
              text: 'Edit Profile',
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
            ),
          );
        },
      ),
    );
  }
}
