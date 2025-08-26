import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/user_widget.dart';

class TheripstTermentPlanSkeltonizerWidget extends StatelessWidget {
  const TheripstTermentPlanSkeltonizerWidget({
    super.key,
    required this.usersData,
  });

  final UserData usersData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
        ),
        title: 'treatmentPlans'.tr(),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserWidgetTheripst(userData: usersData),
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
                  child: Row(
                    children: [
                      Text(
                        "Total Of treatment",
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
                ),
                18.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
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
                    child: Row(
                      children: [
                        Text(
                          "treatment name",
                          style: Styles.captionEmphasis.copyWith(
                            color: AppColors.neutralColor600,
                          ),
                        ),
                        const Spacer(),
                        Text("See Details",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.secondaryColor500,
                            )),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => 18.verticalSpace,
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
