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
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_main_app_bar_in_home_widget.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/banner_widget.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/best_doctors_widget.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/our_services_widget.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';
import 'package:truee_balance_app/features/user/notification/notification/bloc/cubit/notification_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor900,
        appBar: CustomMainAppBarInHomeWidget(
          userName: CacheHelper.getData(key: CacheKeys.userName) ?? "",
          location: 'myAddressHere'.tr(),
          profileImageAsset: CacheHelper.getData(key: CacheKeys.userImage) ??
              "",
          notificationCount: context.watch<NotificationCubit>().notificationCount.toString(),
        ),
        body: Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BannerWidget(),
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
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.ourServicesScreen);
                      },
                      child: Text(
                        'seeAll'.tr(),
                        style: Styles.captionAccent.copyWith(
                          color: AppColors.secondaryColor500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.secondaryColor500,
                          decorationThickness: 1.5.w,
                        ),
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                const OurServicesWidget(),
                30.verticalSpace,
                GestureDetector(
                  onTap: () =>
                      MainLayoutCubit.get(context).changeBottomNavBar(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'bestDoctors'.tr(),
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
                ),
                12.verticalSpace,
                const BestDoctorsWidget(),
                30.verticalSpace,
              ],
            ),
          ),
        ),
    );
  }
}
