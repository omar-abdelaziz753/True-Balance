import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/text/custom_text_rich_widget.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.description,
    this.isEdit = false,
    this.onEditTap,
  });

  final String title1;
  final String title2;
  final String description;
  final bool? isEdit;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        SvgPicture.asset(
          'assets/images/svg/app_logo_icon.svg',
          width: 150.w,
        ),
        60.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title1,
              style: Styles.heroAccent.copyWith(
                color: AppColors.neutralColor100,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor500,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                title2,
                style: Styles.heroAccent.copyWith(
                  color: AppColors.neutralColor100,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 38.w,
          ),
          // child: Row(
          //   children: [
          //     Text(
          //       description,
          //       style: Styles.captionRegular.copyWith(
          //         color: AppColors.neutralColor200,
          //         // height: 2.h,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //     SvgPicture.asset(
          //       'assets/images/svg/edit_email.svg',
          //     )
          //   ],
          // ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Styles.captionRegular.copyWith(
                color: AppColors.neutralColor200,
              ),
              children: [
                TextSpan(
                  text: description, // e.g., "Xxxx@Example.Com ",
                ),
                if (isEdit == true)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      onTap: onEditTap,
                      child: SvgPicture.asset(
                        'assets/images/svg/edit_email.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        32.verticalSpace,
      ],
    );
  }
}
