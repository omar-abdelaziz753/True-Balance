
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/user/notification/presentation/screens/notification_screen.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.showDateHeader,
    required this.item,
  });

  final bool showDateHeader;
  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDateHeader) ...[
          Text(
            item.date,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: const Color(0xff212121),
            ),
          ),
          18.verticalSpace,
        ],
        Container(
          margin: EdgeInsets.only(bottom: 18.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadius + 4.r),
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(23.33.sp),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor900,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      item.subtitle,
                      style: Styles.captionRegular.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
