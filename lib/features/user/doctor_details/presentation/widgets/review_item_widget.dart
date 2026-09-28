import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/features/user/doctor_details/data/model/doctor_details_model.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key, required this.userRating});
  final UserRating userRating;
  @override
  Widget build(BuildContext context) {
    // Support both old format (userName, userRate) and new format (name, rating, text)
    final name = userRating.userName ?? userRating.name ?? '';
    final image = userRating.userImage ?? userRating.image;
    final rating = userRating.userRate ?? userRating.rating ?? 5;
    final message = userRating.userMessage ?? userRating.text ?? '';
    final date = userRating.date ?? '';

    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralColor200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.neutralColor100,
                backgroundImage: image != null && image.isNotEmpty
                    ? CachedNetworkImageProvider(image)
                    : null,
                child: image == null || image.isEmpty
                    ? Icon(Icons.person,
                        size: 20, color: AppColors.neutralColor500)
                    : null,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralColor900,
                      ),
                    ),
                    if (date.isNotEmpty)
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.neutralColor500,
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: AppColors.primaryColor900,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutralColor900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (message.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.neutralColor700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
