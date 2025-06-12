import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/notification/presentation/widgets/notification_item_widget.dart';

class NotificationItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
  });
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notifications = [
      NotificationItem(
        icon: Icons.discount,
        title: '30% Special Discount!',
        subtitle: 'Special Promotion Only Valid Today',
        date: 'Today',
      ),
      NotificationItem(
        icon: Icons.account_balance_wallet,
        title: 'Top Up E-Wallet Successful!',
        subtitle: 'You Have To Top Up Your E-Wallet',
        date: 'Yesterday',
      ),
      NotificationItem(
        icon: Icons.location_on,
        title: 'New Services Available!',
        subtitle: 'Now You Can Track Orders In Real Time',
        date: 'Yesterday',
      ),
      NotificationItem(
        icon: Icons.credit_card,
        title: 'Credit Card Connected!',
        subtitle: 'Credit Card Has Been Linked!',
        date: 'December 22, 2024',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () => Navigator.pop(context),
        ),
        title: "Notifications",
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            final bool showDateHeader =
                index == 0 || item.date != notifications[index - 1].date;

            return NotificationItemWidget(
              showDateHeader: showDateHeader,
              item: item,
            );
          },
        ),
      ),
    );
  }
}
