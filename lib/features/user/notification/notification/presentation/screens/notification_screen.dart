import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:true_balance_app/features/user/notification/notification/bloc/cubit/notification_cubit.dart';
import 'package:true_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:true_balance_app/features/user/notification/notification/presentation/widgets/notification_item_widget.dart';
import 'package:true_balance_app/features/user/notification/notification/presentation/widgets/notification_section_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();

    return BlocConsumer<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          current is NotificationSuccess ||
          current is NotificationLoading ||
          current is NotificationError ||
          current is NotificationLoadingMore ||
          current is NotificationDeletedLoading ||
          current is NotificationDeletedSuccess ||
          current is NotificationDeletedError ||
          current is NotificationMarkSingleAsReadSuccess ||
          current is NotificationDeleteSingleSuccess,
      listener: (context, state) {
        if (state is NotificationDeletedSuccess ||
            state is NotificationMarkSingleAsReadSuccess ||
            state is NotificationDeleteSingleSuccess) {
          cubit.getNotifications();
        }
      },
      builder: (context, state) {
        final isLoading = state is NotificationLoading;
        final hasNotifications = cubit.notificationsResponse != null &&
            (cubit.notificationsResponse?.data?.today?.notifications
                        ?.isNotEmpty ==
                    true ||
                cubit.notificationsResponse?.data?.yesterday?.notifications
                        ?.isNotEmpty ==
                    true ||
                cubit.notificationsResponse?.data?.last7Days?.notifications
                        ?.isNotEmpty ==
                    true ||
                cubit.notificationsResponse?.data?.older?.notifications
                        ?.isNotEmpty ==
                    true);

        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: Navigator.canPop(context)
                ? BackButton(
                    color: AppColors.neutralColor100,
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            title: 'notifications'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
            actions: [
              if (cubit.notificationsResponse?.data?.totalUnread != null &&
                  cubit.notificationsResponse!.data!.totalUnread! > 0)
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${cubit.notificationsResponse?.data?.totalUnread}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              IconButton(
                onPressed: () {
                  cubit.deleteAllNotifications();
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.neutralColor100,
                ),
              ),
              if (cubit.notificationsResponse?.data?.totalUnread != null &&
                  cubit.notificationsResponse!.data!.totalUnread! > 0)
                IconButton(
                  onPressed: () {
                    cubit.makeAsRead();
                  },
                  icon: Icon(
                    Icons.done_all,
                    color: AppColors.neutralColor100,
                  ),
                ),
            ],
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: isLoading
                      ? Skeletonizer(
                          enabled: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final dummyItem = NotificationItem(
                                type: 'general',
                                title: 'Test Account',
                                description: 'Test Account Test',
                                createdAtString: 'Today',
                                isRead: false,
                              );
                              return NotificationItemWidget(item: dummyItem);
                            },
                          ),
                        )
                      : !hasNotifications
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.notifications_off_outlined,
                                    size: 64.sp,
                                    color: const Color(0xFFC7C7CC),
                                  ),
                                  16.verticalSpace,
                                  Text(
                                    'noNotifications'.tr(),
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF8E8E93),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () async {
                                await cubit.getNotifications();
                              },
                              color: AppColors.primaryColor900,
                              child: ListView(
                                controller: cubit.notificationScrollController,
                                padding: EdgeInsets.all(16.w),
                                children: [
                                  NotificationSectionWidget(
                                    title: 'today'.tr(),
                                    notifications: cubit.notificationsResponse
                                            ?.data?.today?.notifications ??
                                        [],
                                    onNotificationTap: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null && item.isRead != true) {
                                        cubit.markAsRead(id);
                                      }
                                    },
                                    onNotificationDismissed: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null) {
                                        cubit.deleteNotification(id);
                                      }
                                    },
                                  ),
                                  NotificationSectionWidget(
                                    title: 'yesterday'.tr(),
                                    notifications: cubit.notificationsResponse
                                            ?.data?.yesterday?.notifications ??
                                        [],
                                    onNotificationTap: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null && item.isRead != true) {
                                        cubit.markAsRead(id);
                                      }
                                    },
                                    onNotificationDismissed: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null) {
                                        cubit.deleteNotification(id);
                                      }
                                    },
                                  ),
                                  NotificationSectionWidget(
                                    title: 'last7days'.tr(),
                                    notifications: cubit.notificationsResponse
                                            ?.data?.last7Days?.notifications ??
                                        [],
                                    onNotificationTap: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null && item.isRead != true) {
                                        cubit.markAsRead(id);
                                      }
                                    },
                                    onNotificationDismissed: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null) {
                                        cubit.deleteNotification(id);
                                      }
                                    },
                                  ),
                                  NotificationSectionWidget(
                                    title: 'older'.tr(),
                                    notifications: cubit.notificationsResponse
                                            ?.data?.older?.notifications ??
                                        [],
                                    onNotificationTap: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null && item.isRead != true) {
                                        cubit.markAsRead(id);
                                      }
                                    },
                                    onNotificationDismissed: (item) {
                                      final id = int.tryParse(item.id ?? '');
                                      if (id != null) {
                                        cubit.deleteNotification(id);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
