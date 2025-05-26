import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/drop_down/custom_drop_down_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.verticalSpace,
          Text(
            "Service type",
            style: Styles.highlightAccent,
          ),
          8.verticalSpace,
          const CustomDropdownButtonWidget(
            hint: 'selectItem',
            items: [
              "home",
              "home",
              "home",
            ],
          ),
          18.verticalSpace,
          Text(
            "your Location",
            style: Styles.highlightAccent,
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesSvgMyAddressesIcon,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My address",
                        style: Styles.contentAccent,
                      ),
                      4.verticalSpace,
                      Text(
                        "123 Main St, Anytown, USA",
                        style: Styles.footnoteSemiboldBold.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_right_outlined,
                    color: AppColors.primaryColor900)
              ],
            ),
          ),
          18.verticalSpace,
          Text(
            "Session details",
            style: Styles.highlightAccent,
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_1280.png",
                  width: 55.sp,
                  height: 55.sp,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My address",
                        style: Styles.contentAccent,
                      ),
                      4.verticalSpace,
                      Text(
                        "123 Main St, Anytown, USA",
                        style: Styles.footnoteSemiboldBold.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          14.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: Styles.footnoteSemiboldBold.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$150.00",
                  style: Styles.contentAccent,
                ),
                // 4.verticalSpace,
              ],
            ),
          ),
          // 170.verticalSpace,
        ],
      ),
    );
  }
}
