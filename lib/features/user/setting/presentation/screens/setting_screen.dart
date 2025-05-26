import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/container/custom_divider_widget.dart';
import 'package:truee_balance_app/features/user/setting/presentation/widgets/custom_row_in_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'Setting',
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
                    /// General Setting
                    Text(
                      'General',
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
                            imagePath: 'assets/images/svg/my_booing_icon.svg',
                            title: 'My Booking',
                            subtitle:
                                'appointments with the ability to follow up',
                            onTap: () => context.pushNamed(Routes.myBookingScreen),
                          ),
                          CustomDividerWidget(),
                          CustomRowInSettingWidget(
                            imagePath:
                                'assets/images/svg/my_addresses_icon.svg',
                            title: 'My address',
                            subtitle:
                                'All your current address for easy booking',
                            onTap: () {},
                          ),
                          CustomDividerWidget(),
                          CustomRowInSettingWidget(
                            imagePath:
                                'assets/images/svg/technical_support_icon.svg',
                            title: 'Technical support',
                            subtitle: 'How can we help you today?',
                            onTap: () => context
                                .pushNamed(Routes.technicalSupportScreen),
                          ),
                          CustomDividerWidget(),
                          CustomRowInSettingWidget(
                            imagePath:
                                'assets/images/svg/account_information_icon.svg',
                            title: 'account information',
                            subtitle:
                                'Change Your account information & password',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    /// More Setting
                    Text(
                      'More',
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
                            title: 'Language',
                            subtitle:
                                'preferred language for displaying content.',
                            onTap: () {},
                          ),
                          CustomDividerWidget(),
                          CustomRowInSettingWidget(
                            imagePath: 'assets/images/svg/logout_icon.svg',
                            title: 'Logout',
                            subtitle: 'Log out of the account',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
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
