import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_main_app_bar_in_home_widget.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/custom_service_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: const CustomMainAppBarInHomeWidget(
        userName: 'Omar Abdelaziz',
        location: 'My Address Here',
        profileImageAsset: 'assets/images/png/profile_image.png',
        notificationCount: '3',
      ),
      body: Container(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ourServices'.tr(),
                  style: Styles.captionAccent.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                Text(
                  'seeAll'.tr(),
                  style: Styles.captionAccent.copyWith(
                    color: AppColors.secondaryColor500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondaryColor500,
                    decorationThickness: 1.5.w,
                  ),
                ),
              ],
            ),
            12.verticalSpace,

            /// Replace this part inside your build method
            SizedBox(
              height: 120.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => 12.horizontalSpace,
                itemBuilder: (context, index) {
                  final titles = [
                    'Physiotherapy',
                    'Occupational Therapy',
                    'Speech Therapy',
                    'Speech Therapy',
                  ];

                  return CustomServiceCardWidget(
                    title: titles[index],
                    icon: Placeholder(
                      fallbackHeight: 44.h,
                      fallbackWidth: 44.w,
                      color: Colors.black.withAlpha(20),
                    ),
                  );
                },
              ),
            ),
            30.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'bestTherapists'.tr(),
                  style: Styles.captionAccent.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                Text(
                  'seeAll'.tr(),
                  style: Styles.captionAccent.copyWith(
                    color: AppColors.secondaryColor500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondaryColor500,
                    decorationThickness: 1.5.w,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            SizedBox(
              height: 120.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => 12.horizontalSpace,
                itemBuilder: (context, index) {
                  return Container(
                    // padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: const Color.fromARGB(255, 24, 20, 20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            Assets.assetsImagesSvgBackground,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Wade Warren",
                          style: Styles.contentRegular,
                        ),
                        5.verticalSpace,
                        Text(
                          "Physiotherapist",
                          style: Styles.captionAccent,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
