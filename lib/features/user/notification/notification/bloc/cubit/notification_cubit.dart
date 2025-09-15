import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepo) : super(NotificationInitial());

  final NotificationRepo notificationRepo;
  NotificationsResponse? notificationsResponse;

  /// Scroll controller to handle infinite scrolling
  final ScrollController notificationScrollController = ScrollController();

  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  /// Call this in initState of your screen to setup scroll listener
  void setupNotificationScrollController() {
    notificationScrollController.addListener(() {
      if (notificationScrollController.position.pixels >=
          notificationScrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreNotifications();
      }
    });
  }

  Future<void> getNotifications() async {
    currentPage = 1;
    emit(NotificationLoading());

    final result = await notificationRepo.getNotification(currentPage);
    result.when(
      success: (data) {
        notificationsResponse = data;

        // get pagination data
        final pagination = data.data?.older?.pagination;
        if (pagination != null) {
          currentPage = pagination.currentPage ?? 1;
          lastPage = pagination.lastPage ?? 1;
        }

        emit(NotificationSuccess());
      },
      failure: (error) {
        emit(NotificationError());
      },
    );
  }

  Future<void> loadMoreNotifications() async {
    if (isLoadingMore || currentPage >= lastPage) return;

    isLoadingMore = true;
    emit(NotificationLoadingMore());

    final result = await notificationRepo.getNotification(currentPage + 1);
    result.when(
      success: (data) {
        final newOlder = data.data?.older;
        final existingOlder = notificationsResponse?.data?.older;

        // append older notifications
        if (newOlder?.notifications != null &&
            newOlder!.notifications!.isNotEmpty) {
          existingOlder?.notifications?.addAll(newOlder.notifications!);
        }

        // update pagination info
        final pagination = newOlder?.pagination;
        if (pagination != null) {
          currentPage = pagination.currentPage ?? currentPage;
          lastPage = pagination.lastPage ?? lastPage;
        }

        emit(NotificationSuccess());
      },
      failure: (error) {
        emit(NotificationError());
      },
    );

    isLoadingMore = false;
  }
}
