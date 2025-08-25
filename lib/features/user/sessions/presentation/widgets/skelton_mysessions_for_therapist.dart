import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';

class SkeltonMySessionsForTherapist extends StatelessWidget {
  const SkeltonMySessionsForTherapist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'mySessions'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Skeletonizer(
        enabled: true,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: ListView.separated(
            itemCount: 9,
            separatorBuilder: (context, index) => 18.verticalSpace,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: AppColors.neutralColor100,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.neutralColor1000.withAlpha(20),
                    width: 1.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2.h),
                      blurRadius: 8.r,
                      spreadRadius: 0,
                      color: Colors.black.withAlpha(20),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        width: 55.w,
                        height: 55.h,
                        color: Colors.grey[300],
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        spacing: 4.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14.h,
                            color: Colors.grey[300],
                          ),
                          Container(
                            height: 12.h,
                            width: 150.w,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
