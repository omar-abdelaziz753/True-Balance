import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key, required this.userRating});
  final UserRating userRating;
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
                  backgroundImage: CachedNetworkImageProvider(
                    userRating.userImage ?? "https://via.placeholder.com/150",
                  )),
              SizedBox(width: 12.sp),
              Text(userRating.userName ?? '',
                  style: Styles.contentBold
                      .copyWith(color: AppColors.neutralColor1000)),
              const Spacer(),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 16,
                    color: index < (userRating.userRate ?? 5)
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
          5.verticalSpace,
          Text(
            userRating.userMessage ?? "",
            style: Styles.contentEmphasis.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          // 8.verticalSpace,
          Text(
            userRating.date ?? "",
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
