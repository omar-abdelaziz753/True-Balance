import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class SkeletonizerTreatmentDetailsWidget extends StatelessWidget {
  const SkeletonizerTreatmentDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
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
        child: Column(
          children: [
            Container(
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
                    child: Image.asset(
                      "assets/images/png/profile_image.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Adel',
                          style: Styles.contentBold.copyWith(
                            color: AppColors.neutralColor1000,
                          ),
                        ),
                        Text(
                          'Specialization Here',
                          style: Styles.footnoteEmphasis.copyWith(
                            color: AppColors.neutralColor600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            18.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: AppColors.neutralColor100,
                borderRadius: BorderRadius.circular(4.r),
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
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total Of Session",
                        style: Styles.captionEmphasis.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "10",
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Type of treatment",
                        style: Styles.captionEmphasis.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Text",
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Notes",
                    style: Styles.captionEmphasis.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                  ),
                  Text(
                    "Notes..",
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                ],
              ),
            ),
            18.verticalSpace,
            TabBar(
              unselectedLabelColor: AppColors.neutralColor600,
              labelColor: AppColors.primaryColor800,
              indicatorColor: AppColors.primaryColor800,
              dividerColor: AppColors.neutralColor300,
              automaticIndicatorColorAdjustment: true,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Pending'.tr()),
                Tab(text: 'Completed'.tr()),
              ],
            ),
            18.verticalSpace,
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                      padding: EdgeInsets.all(12.sp),
                      itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: AppColors.neutralColor100,
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: AppColors.primaryColor900,
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
                              spacing: 10.sp,
                              children: [
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Session 3',
                                    style: Styles.captionEmphasis.copyWith(
                                      color: AppColors.neutralColor1000,
                                    ),
                                  ),
                                ),
                                // const Spacer(),
                                Text(
                                  "See Details",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondaryColor500,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        AppColors.secondaryColor500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => 18.verticalSpace,
                      itemCount: 10),
                  ListView.separated(
                    padding: EdgeInsets.all(12.sp),
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.neutralColor100,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: AppColors.primaryColor900,
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
                        spacing: 10.sp,
                        children: [
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              'Session 1',
                              style: Styles.captionEmphasis.copyWith(
                                color: AppColors.neutralColor1000,
                              ),
                            ),
                          ),
                          // const Spacer(),
                          Text(
                            "See Details",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.secondaryColor500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => 18.verticalSpace,
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
