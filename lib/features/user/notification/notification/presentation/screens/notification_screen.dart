import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/notification/notification/bloc/cubit/notification_cubit.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:truee_balance_app/features/user/notification/notification/presentation/widgets/notification_item_widget.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          current is NotificationSuccess ||
          current is NotificationError ||
          current is NotificationLoading,
      builder: (context, state) {
        if (state is NotificationLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              leading: CacheHelper.getData(key: CacheKeys.type) == 'doctor' ||
                      CacheHelper.getData(key: CacheKeys.type) == 'therapist'
                  ? const SizedBox.shrink()
                  : BackButton(
                      color: AppColors.neutralColor100,
                      onPressed: () => Navigator.pop(context),
                    ),
              title: 'notifications'.tr(),
              backgroundColor: AppColors.primaryColor900,
              svgAsset: 'assets/images/svg/bg_image.svg',
            ),
            body: Skeletonizer(
              enabled: true,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                  color: AppColors.neutralColor100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final dummyItem = NotificationItem(
                      type: 'dummy',
                      title: '',
                      description: '',
                      createdAt: '',
                    );
                    return NotificationItemWidget(item: dummyItem);
                  },
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: CacheHelper.getData(key: CacheKeys.type) == 'doctor' ||
                    CacheHelper.getData(key: CacheKeys.type) == 'therapist'
                ? const SizedBox.shrink()
                : BackButton(
                    color: AppColors.neutralColor100,
                    onPressed: () => Navigator.pop(context),
                  ),
            title: 'notifications'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: ListView(
              children: [
                NotificationSectionWidget(
                  title: 'Today',
                  notifications:
                      cubit.notificationsResponse?.data?.today?.notifications,
                ),
                NotificationSectionWidget(
                  title: 'Yesterday',
                  notifications: cubit
                      .notificationsResponse?.data?.yesterday?.notifications,
                ),
                NotificationSectionWidget(
                  title: 'Last 7 days',
                  notifications: cubit
                      .notificationsResponse?.data?.last7Days?.notifications,
                ),
                NotificationSectionWidget(
                  title: 'older',
                  notifications:
                      cubit.notificationsResponse?.data?.older?.notifications,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
