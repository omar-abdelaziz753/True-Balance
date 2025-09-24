import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomBookingContainerWidget extends StatelessWidget {
  final String date;
  final String time;
  final String status;

  const CustomBookingContainerWidget({
    super.key,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        spacing: 6.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date: $date",
            style: Styles.contentBold.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          Text(
            "Time: $time",
            style: Styles.footnoteEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
          Text(
            "Status: $status",
            style: Styles.footnoteEmphasis.copyWith(
                color: status == "pending" ? Colors.orange : Colors.green),
          ),
        ],
      ),
    );
  }
}
