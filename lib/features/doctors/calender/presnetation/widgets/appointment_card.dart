import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class AppointmentCard extends StatelessWidget {
  final String time;
  final String name;
  final String specialization;
  final String status;
  final String imageUrl;
  final int? age;
  final String? gender;

  const AppointmentCard({
    super.key,
    required this.time,
    required this.name,
    required this.specialization,
    required this.status,
    required this.imageUrl,
    this.age,
    this.gender,
  });

  Color _statusColor() {
    switch (status.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "completed":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutralColor300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.neutralColor200,
            backgroundImage:
                imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
            child: imageUrl.isEmpty
                ? Icon(Icons.person,
                    size: 32.sp, color: AppColors.neutralColor600)
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralColor900,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  specialization,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.neutralColor600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor900,
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                decoration: BoxDecoration(
                  color: _statusColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status.tr(),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: _statusColor(),
                  ),
                ),
              ),
              if (age != null) ...[
                SizedBox(height: 4.h),
                Text(
                  "${"age".tr()}: $age".toString(),
                  style: Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
              ],
              if (gender != null) ...[
                SizedBox(height: 2.h),
                Text(
                  "${"gender".tr()}: $gender",
                  style: Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
