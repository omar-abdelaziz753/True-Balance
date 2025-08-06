import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/therapists/appointments_details/presentation/widgets/custom_row_title_and_status_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class CustomAppointmentDetailsCardWidget extends StatelessWidget {
  const CustomAppointmentDetailsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              SvgPicture.asset(
                "assets/images/svg/appointments_rounded.svg",
                width: 55.w,
                height: 55.h,
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ahmed Adel",
                    style: Styles.contentBold.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDB43).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                          AppConstants.borderRadius - 4.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    child: Text(
                      "Pending",
                      style: Styles.footnoteRegular.copyWith(
                        color: AppColors.yellowColor100,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        18.verticalSpace,
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.neutralColor100,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2.h),
                blurRadius: 8.r,
                spreadRadius: 0,
                color: Colors.black.withAlpha(20),
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.neutralColor1000.withAlpha(20),
              width: 1.sp,
            ),
          ),
          child: Column(
            spacing: 12.h,
            children: [
              CustomRowMakeTitleAndDescWidget(
                title: 'date'.tr(),
                description: 'January 5',
              ),
              CustomRowMakeTitleAndDescWidget(
                title: 'time'.tr(),
                description: '7:00 AM',
              ),
              CustomRowMakeTitleAndDescWidget(
                title: 'checkIn'.tr(),
                description: 'December 23, 2022',
              ),
              const CustomRowTitleAndStatus(),
            ],
          ),
        ),
        18.verticalSpace,
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.neutralColor100,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2.h),
                blurRadius: 8.r,
                spreadRadius: 0,
                color: Colors.black.withAlpha(20),
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.neutralColor1000.withAlpha(20),
              width: 1.sp,
            ),
          ),
          child: Column(
            spacing: 12.h,
            children: [
              const CustomRowMakeTitleAndDescWidget(
                title: 'Name',
                description: 'Ahmed Adel',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Phone Number ',
                description: '+1 111 467 378 399',
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomButtonWidget(
          text: 'completed'.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
