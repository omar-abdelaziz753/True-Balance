import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/hex_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomServiceCardWidget extends StatelessWidget {
  final String title;
  final Widget icon;

  const CustomServiceCardWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.neutralColor1000.withAlpha(20),
        ),
        boxShadow: [
          BoxShadow(
            color: hexToColor('#0062FF').withAlpha(5),
            blurRadius: 50.r,
            spreadRadius: 0,
            offset: Offset(10.w, 10.h),
          ),
        ],
      ),
      child: Column(
        spacing: 8.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor1000,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
