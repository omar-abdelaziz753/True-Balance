import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomRowTitleAndStatus extends StatelessWidget {
  const CustomRowTitleAndStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'status'.tr(),
          style: Styles.captionEmphasis.copyWith(
            color: AppColors.neutralColor600,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFDB43).withValues(alpha: 0.1) ,
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadius - 4.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          child: Text(
            "Pending",
            style: Styles.footnoteRegular.copyWith(
              color: AppColors.yellowColor100,
            ),
          ),
        ),
      ],
    );
  }
}
