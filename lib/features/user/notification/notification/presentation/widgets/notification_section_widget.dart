import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:truee_balance_app/features/user/notification/notification/presentation/widgets/notification_item_widget.dart';

class NotificationSectionWidget extends StatelessWidget {
  final String title;
  final List<NotificationItem>? notifications;

  const NotificationSectionWidget({
    super.key,
    required this.title,
    this.notifications,
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
          padding: EdgeInsets.symmetric(vertical: 18.sp),
          child: Text(title, style: Styles.captionAccent),
        ),
        ...notifications!.map((e) => NotificationItemWidget(item: e)),
      ],
    );
  }
}