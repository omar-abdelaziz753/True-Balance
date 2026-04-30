import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/themes/text_colors.dart';
import 'package:true_balance_app/features/user/notification/notification/data/model/notifications_response.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.item,
    this.onTap,
    this.onDismissed,
  });

  final NotificationItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDismissed;

  IconData _getIcon() {
    switch (item.type) {
      case 'treatment_plans':
        return Icons.assignment_outlined;
      case 'consultations':
        return Icons.chat_bubble_outline;
      case 'reviews':
        return Icons.star_outline;
      case 'payments':
        return Icons.payment_outlined;
      case 'bookings':
        return Icons.calendar_today_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  Color _getIconColor() {
    switch (item.type) {
      case 'treatment_plans':
        return const Color(0xFF34C759);
      case 'consultations':
        return const Color(0xFF007AFF);
      case 'reviews':
        return const Color(0xFFFF9500);
      case 'payments':
        return const Color(0xFF5856D6);
      case 'bookings':
        return const Color(0xFFFF3B30);
      default:
        return AppColors.primaryColor900;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUnread = item.isRead != true;

    return Dismissible(
      key: Key(item.id ?? ''),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFF3B30),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isUnread ? const Color(0xFFF5F7FA) : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isUnread ? const Color(0xFFE8EBED) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: _getIconColor().withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  _getIcon(),
                  color: _getIconColor(),
                  size: 22.sp,
                ),
              ),
              14.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (isUnread) ...[
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF007AFF),
                              shape: BoxShape.circle,
                            ),
                          ),
                          8.horizontalSpace,
                        ],
                        Expanded(
                          child: Text(
                            item.title ?? '',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight:
                                  isUnread ? FontWeight.w600 : FontWeight.w500,
                              color: const Color(0xFF1C1C1E),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    6.verticalSpace,
                    Text(
                      item.description ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8E8E93),
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.sp,
                          color: const Color(0xFFC7C7CC),
                        ),
                        4.horizontalSpace,
                        Text(
                          item.createdAt != null
                              ? DateFormat('MMM d, h:mm a')
                                  .format(item.createdAt!)
                              : (item.createdAtString ?? ''),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFC7C7CC),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.chevron_right,
                size: 20.sp,
                color: const Color(0xFFC7C7CC),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
