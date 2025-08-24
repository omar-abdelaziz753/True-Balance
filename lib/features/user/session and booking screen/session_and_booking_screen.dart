import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';

class SessinonsAndBookingScreen extends StatelessWidget {
  const SessinonsAndBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: " Booking & Sessions".tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
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
                TabBar(
                  unselectedLabelColor: AppColors.neutralColor600,
                  labelColor: AppColors.primaryColor800,
                  indicatorColor: AppColors.primaryColor800,
                  dividerColor: AppColors.neutralColor300,
                  automaticIndicatorColorAdjustment: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'myBooking'.tr()),
                    Tab(text: 'mySessions'.tr()),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text("Booking Screen")),
                      Center(child: Text("Sessions Screen")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
