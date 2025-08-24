import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomRowInSettingWidget extends StatelessWidget {
  const CustomRowInSettingWidget(
      {super.key,
      this.imagePath,
      required this.title,
      required this.subtitle,
      required this.onTap,
      this.iconcolor
      // this.icon,
      });
  final dynamic imagePath;
  final String title, subtitle;
  final VoidCallback onTap;
  // final Widget? icon;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 8.w,
        children: [
          imagePath is String
              ? SvgPicture.asset(
                  imagePath!,
                  fit: BoxFit.scaleDown,
                )
              : Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: iconcolor?.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Icon(
                    imagePath,
                    color: iconcolor,
                    size: 24.sp,
                  ),
                ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppConstants.screenWidth(context) / 1.5,
                  child: Column(
                    spacing: 4.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: Styles.footnoteRegular.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor900,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
