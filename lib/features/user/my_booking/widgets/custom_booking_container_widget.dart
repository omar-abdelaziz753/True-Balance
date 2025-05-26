import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomBookingContainerWidget extends StatelessWidget {
  final String specialization;
  final String doctorName;
  final double rating;
  final String ratingText;
  final Widget image;

  const CustomBookingContainerWidget({
    super.key,
    required this.specialization,
    required this.doctorName,
    required this.rating,
    required this.ratingText,
    required this.image,
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
          image,
          12.horizontalSpace,
          Expanded(
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialization,
                  style: Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
                Text(
                  doctorName,
                  style: Styles.contentBold.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/star_icon.svg',
                    ),
                    Text(
                      ' $rating | ($ratingText)',
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
