
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 27.r,
                backgroundImage: const AssetImage(
                  'assets/images/png/profile.png',
                ),
              ),
              SizedBox(width: 12.sp),
              Text("Name Here",
                  style: Styles.contentBold
                      .copyWith(color: AppColors.neutralColor1000)),
              const Spacer(),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 16,
                    color: index < 4
                        ? AppColors.primaryColor900
                        : Colors.grey[300],
                  ),
                ),
              )
            ],
          ),
          12.verticalSpace,
          Divider(
            color: AppColors.neutralColor300,
          ),
          12.verticalSpace,
          Text(
            "The Service Was Great! The Service Provider Was Professional And Arrived On Time. I Would Recommend Them To Everyone. Thanks To Harfa App For The Excellent Experience.",
            style: Styles.contentEmphasis.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          8.verticalSpace,
          Text(
            "6 Hours Ago",
            style: Styles.contentEmphasis.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.neutralColor600),
          ),
        ],
      ),
    );
  }
}
