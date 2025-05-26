import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class BookingDetailsWidget extends StatelessWidget {
  const BookingDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                title: 'Date',
                description: 'January 5',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Time',
                description: '7:00 AM',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Check in',
                description: 'December 23, 2022',
              ),
            ],
          ),
        ),
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
                description: 'Omar AbdelAziz',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Phone Number',
                description: '+201 027 324 902',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Therapists Name',
                description: 'Ahmed Hossam',
              ),
            ],
          ),
        ),
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
                title: 'Total',
                description: '\$150.00',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
