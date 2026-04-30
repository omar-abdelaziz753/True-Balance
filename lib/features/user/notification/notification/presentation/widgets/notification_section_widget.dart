import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/text_colors.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:true_balance_app/features/user/notification/notification/presentation/widgets/notification_item_widget.dart';

class NotificationSectionWidget extends StatelessWidget {
  final String title;
  final List<NotificationItem>? notifications;
  final Function(NotificationItem)? onNotificationTap;
  final Function(NotificationItem)? onNotificationDismissed;

  const NotificationSectionWidget({
    super.key,
    required this.title,
    this.notifications,
    this.onNotificationTap,
    this.onNotificationDismissed,
  });

  @override
  Widget build(BuildContext context) {
    if (notifications == null || notifications!.isEmpty) {
      return const SizedBox.shrink();
    }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.neutralColor600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...notifications!.map(
          (e) => NotificationItemWidget(
            item: e,
            onTap: () => onNotificationTap?.call(e),
            onDismissed: () => onNotificationDismissed?.call(e),
          ),
        ),
      ],
    );
  }
}
