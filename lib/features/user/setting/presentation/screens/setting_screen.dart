import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/container/custom_divider_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/localization/presentation/localization_screen.dart';
import 'package:truee_balance_app/features/user/setting/presentation/widgets/custom_row_in_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDoctor = CacheHelper.getData(key: CacheKeys.type) == "doctor";
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'setting'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isDoctor) ...[
                      Text(
                        'general'.tr(),
                        style: Styles.highlightEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 12.w,
                          bottom: 18.w,
                        ),
                        child: Column(
                          spacing: 18.h,
                          children: [
                            CustomRowInSettingWidget(
                              imagePath:
                                  'assets/images/svg/account_information_icon.svg',
                              title: 'accountInformation'.tr(),
                              subtitle: 'changeYourAccount'.tr(),
                              onTap: () =>
                                  context.pushNamed(Routes.profileScreen),
                            ),
                            const CustomDividerWidget(),
                            CustomRowInSettingWidget(
                              imagePath: Icons.wallet,
                              iconcolor: AppColors.primaryColor900,
                              title: 'myBooking'.tr(),
                              subtitle: 'appointmentsWiththeAbility'.tr(),
                              onTap: () =>
                                  context.pushNamed(Routes.completedCousultations),
                            ),
                            const CustomDividerWidget(),
                            CustomRowInSettingWidget(
                              imagePath: 'assets/images/svg/language_icon.svg',
                              title: 'language'.tr(),
                              subtitle: 'descriptionOfLanguage'.tr(),
                              onTap: () {
                                showLocalizationBottomSheet(context);
                              },
                            ),
                            const CustomDividerWidget(),
                            BlocProvider(
                              create: (context) => AuthCubit(getIt()),
                              child: BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is LogoutSuccess) {
                                    context.pushNamed(Routes.loginScreen);
                                  }
                                },
                                builder: (context, state) {
                                  return CustomRowInSettingWidget(
                                    imagePath: Icons.logout,
                                    iconcolor: Colors.red,
                                    title: 'logout'.tr(),
                                    subtitle: 'descriptionOfLogout'.tr(),
                                    onTap: () {
                                      context.read<AuthCubit>().logout();
                                    },
                                  );
                                  // CustomRowInSettingWidget(
                                  //   imagePath:
                                  //       "assets/images/svg/logout_icon.svg",
                                  //   title: 'logOut'.tr(),
                                  //   subtitle: 'descriptionOfLogout'.tr(),
                                  //   onTap: () {
                                  //     context.read<AuthCubit>().logout();
                                  //   },
                                  // );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Text(
                        'general'.tr(),
                        style: Styles.highlightEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                          top: 12.w,
                          bottom: 18.w,
                        ),
                        child: Column(
                          spacing: 18.h,
                          children: [
                            CustomRowInSettingWidget(
                              imagePath:
                                  'assets/images/svg/account_information_icon.svg',
                              title: 'accountInformation'.tr(),
                              subtitle: 'changeYourAccount'.tr(),
                              onTap: () =>
                                  context.pushNamed(Routes.profileScreen),
                            ),
                            const CustomDividerWidget(),
                            CustomRowInSettingWidget(
                              imagePath: Icons.wallet,
                              iconcolor: AppColors.primaryColor900,
                              title: 'myBooking'.tr(),
                              subtitle: 'appointmentsWiththeAbility'.tr(),
                              onTap: () =>
                                  context.pushNamed(Routes.myBookingScreen),
                            ),
                            const CustomDividerWidget(),
                            CustomRowInSettingWidget(
                              imagePath:
                                  Assets.assetsImagesSvgMedicalReportsIcon,
                              title: 'medicalReports'.tr(),
                              subtitle: 'patientsmedical'.tr(),
                              onTap: () {
                                context.pushNamed(Routes.medicalReportsScreen);
                              },
                            ),
                            const CustomDividerWidget(),
                            CustomRowInSettingWidget(
                              imagePath:
                                  'assets/images/svg/technical_support_icon.svg',
                              title: 'technicalSupport'.tr(),
                              subtitle: 'howCanWeHelp'.tr(),
                              onTap: () => context
                                  .pushNamed(Routes.technicalSupportScreen),
                            ),
                          ],
                        ),
                      ),

                      /// More Setting
                      Text(
                        'more'.tr(),
                        style: Styles.highlightEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 12.w,
                          bottom: 18.w,
                        ),
                        child: Column(
                          spacing: 18.h,
                          children: [
                            CustomRowInSettingWidget(
                              imagePath: 'assets/images/svg/language_icon.svg',
                              title: 'language'.tr(),
                              subtitle: 'descriptionOfLanguage'.tr(),
                              onTap: () {
                                showLocalizationBottomSheet(context);
                              },
                            ),
                            const CustomDividerWidget(),
                            BlocProvider(
                              create: (context) => AuthCubit(getIt()),
                              child: BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is LogoutSuccess) {
                                    context.pushNamed(Routes.loginScreen);
                                  }
                                },
                                builder: (context, state) {
                                  return CustomRowInSettingWidget(
                                    imagePath: Icons.logout,
                                    iconcolor: Colors.red,
                                    title: 'logout'.tr(),
                                    subtitle: 'descriptionOfLogout'.tr(),
                                    onTap: () {
                                      // context.read<AuthCubit>().logout();
                                      context.pushNamedAndRemoveUntil(
                                          Routes.loginScreen);
                                    },
                                  );

                                  // CustomRowInSettingWidget(
                                  //   imagePath:
                                  //       "assets/images/svg/logout_icon.svg",
                                  //   title: 'logOut'.tr(),
                                  //   subtitle: 'descriptionOfLogout'.tr(),
                                  //   onTap: () {
                                  //     context.read<AuthCubit>().logout();
                                  //   },
                                  // );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
