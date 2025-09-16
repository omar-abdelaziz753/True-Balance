import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/notification/notification/bloc/cubit/notification_cubit.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:truee_balance_app/features/user/notification/notification/presentation/widgets/notification_item_widget.dart';
import 'package:truee_balance_app/features/user/notification/notification/presentation/widgets/notification_section_widget.dart';

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
          current is NotificationDeletedError,
      listener: (context, state) {
        if (state is NotificationDeletedSuccess) {
          cubit.setupNotificationScrollController();
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
              IconButton(
                onPressed: () {
                  // cubit.markAllAsRead();
                  cubit.deleteAllNotifications();
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColors.redColor100,
                ),
              ),
            ],
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
                              );
                              return NotificationItemWidget(item: dummyItem);
                            },
                          ),
                        )
                      : !hasNotifications
                          ? Center(child: Text('noNotifications'.tr()))
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    controller:
                                        cubit.notificationScrollController,
                                    children: [
                                      NotificationSectionWidget(
                                        title: 'today'.tr(),
                                        notifications: cubit
                                                .notificationsResponse
                                                ?.data
                                                ?.today
                                                ?.notifications ??
                                            [],
                                      ),
                                      NotificationSectionWidget(
                                        title: 'yesterday'.tr(),
                                        notifications: cubit
                                                .notificationsResponse
                                                ?.data
                                                ?.yesterday
                                                ?.notifications ??
                                            [],
                                      ),
                                      NotificationSectionWidget(
                                        title: 'last7days'.tr(),
                                        notifications: cubit
                                                .notificationsResponse
                                                ?.data
                                                ?.last7Days
                                                ?.notifications ??
                                            [],
                                      ),
                                      NotificationSectionWidget(
                                        title: 'older'.tr(),
                                        notifications: cubit
                                                .notificationsResponse
                                                ?.data
                                                ?.older
                                                ?.notifications ??
                                            [],
                                      ),
                                    ],
                                  ),
                                ),
                                BlocBuilder<NotificationCubit,
                                    NotificationState>(
                                  buildWhen: (previous, current) =>
                                      current is NotificationLoadingMore ||
                                      current is NotificationSuccess,
                                  builder: (context, state) {
                                    if (state is NotificationLoadingMore) {
                                      return const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ],
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
