import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class ChooseAccountWidget extends StatelessWidget {
  const ChooseAccountWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutralColor100,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius + 4),
          border: Border.all(
            width: 1.w,
            color: !isSelected
                ? const Color(0xFF030303).withOpacity(0.1)
                : AppColors.primaryColor900,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(18.0.sp),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/svg/chosse_account.svg",
                  width: 60.w,
                  height: 60.h,
                ),
                12.horizontalSpace,
                Text(
                  title,
                  style: isSelected
                      ? Styles.contentEmphasis
                          .copyWith(color: AppColors.neutralColor1000)
                      : Styles.captionRegular.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            )
            // Column(
            //   children: [
            //     Text(
            //       title,
            //       style: isSelected
            //           ? Styles.contentEmphasis
            //               .copyWith(color: AppColors.neutralColor1000)
            //           : Styles.captionRegular.copyWith(
            //               color: AppColors.neutralColor600,
            //             ),
            //       overflow: TextOverflow.ellipsis,
            //       textAlign: TextAlign.center,
            //     ),
            //     12.verticalSpace,
            //     SvgPicture.asset(
            //       "assets/images/svg/chosse_account.svg",
            //       width: 100.w,
            //       height: 100.h,
            //     ),
            //     8.verticalSpace,
            //   ],
            // ),
            ),
      ),
    );
  }
}
