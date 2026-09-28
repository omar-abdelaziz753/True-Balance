import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/widgets/saudi_riyal_icon.dart';
import 'package:true_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';

class ConsultationCardWidget extends StatelessWidget {
  final Consultation consultation;
  final VoidCallback onTap;

  const ConsultationCardWidget({
    super.key,
    required this.consultation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = consultation.status == "pending";
    final isConfirmed = consultation.status == "confirmed";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isPending
                ? AppColors.primaryColor900.withAlpha(50)
                : isConfirmed
                    ? AppColors.primaryColor900.withAlpha(50)
                    : Colors.grey.withAlpha(50),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: consultation.doctor.image,
                      width: 56.w,
                      height: 56.w,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        width: 56.w,
                        height: 56.w,
                        color: AppColors.neutralColor200,
                        child: Icon(Icons.person, size: 28.sp),
                      ),
                      errorWidget: (_, __, ___) => Container(
                        width: 56.w,
                        height: 56.w,
                        color: AppColors.neutralColor200,
                        child: Icon(Icons.person, size: 28.sp),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          consultation.doctor.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1C1C1E),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.verticalSpace,
                        Text(
                          consultation.doctor.specialization,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF8E8E93),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: isPending || isConfirmed
                              ? AppColors.primaryColor900.withAlpha(15)
                              : Colors.grey.withAlpha(15),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          isPending
                              ? 'pending'.tr()
                              : isConfirmed
                                  ? 'confirmed'.tr()
                                  : consultation.status,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: isPending || isConfirmed
                                ? AppColors.primaryColor900
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                      if (consultation.price != null) ...[
                        6.verticalSpace,
                        RiyalAmount(
                          amount: consultation.price?.toStringAsFixed(0) ?? '0',
                          fontSize: 14,
                          color: AppColors.primaryColor900,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16.sp,
                          color: const Color(0xFF8E8E93),
                        ),
                        6.horizontalSpace,
                        Text(
                          consultation.date,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF636366),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 1, height: 16.h, color: Colors.grey.shade300),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16.sp,
                          color: const Color(0xFF8E8E93),
                        ),
                        6.horizontalSpace,
                        Text(
                          consultation.time,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF636366),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isPending) ...[
                    Container(
                        width: 1, height: 16.h, color: Colors.grey.shade300),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.sp,
                            color: AppColors.primaryColor900,
                          ),
                          4.horizontalSpace,
                          Text(
                            'payNow'.tr(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    const Spacer(),
                    Icon(
                      Icons.chevron_right,
                      size: 20.sp,
                      color: const Color(0xFFC7C7CC),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
