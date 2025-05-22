import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomRowInTechnicalSupportWidget extends StatelessWidget {
  const CustomRowInTechnicalSupportWidget({
    super.key, required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppConstants.screenWidth(context) / 1.3,
            child: Text(
              title,
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor900,
            size: 16.sp,
          )
        ],
      ),
    );
  }
}
