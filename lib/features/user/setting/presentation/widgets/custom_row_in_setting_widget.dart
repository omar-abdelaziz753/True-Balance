import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomRowInSettingWidget extends StatelessWidget {
  const CustomRowInSettingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String imagePath, title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 8.w,
        children: [
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
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
