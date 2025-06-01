
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomAppointmentContainerWidget extends StatelessWidget {
  final String title;
  final String time;
  final String status;
  final String imagePath;

  const CustomAppointmentContainerWidget({
    super.key,
    required this.title,
    required this.time,
    required this.status,
    required this.imagePath,
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
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            width: 95.w,
            height: 95.h,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.contentBold.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDB43).withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius - 4.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  child: Text(
                    status,
                    style: Styles.footnoteRegular.copyWith(
                      color: AppColors.yellowColor100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
