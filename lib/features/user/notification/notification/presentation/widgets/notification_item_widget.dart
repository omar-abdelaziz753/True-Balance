import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.item,
  });

  final NotificationItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  item.type == "treatment_plans"
                      ? Icons.import_contacts
                      : item.type == "consultations"
                          ? Icons.message
                          : item.type == "general"
                              ? Icons.warning
                              : Icons.notifications, 
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
                        item.title ?? '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      item.description ?? '',
                      style: Styles.captionRegular.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      item.createdAt != null
                          ? DateFormat('hh:mm a').format(item.createdAt!) // Format to time
                          : (item.createdAtString ?? ''), // fallback to original string if null
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: const Color(0xff212121),
                      ),
                    )
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
