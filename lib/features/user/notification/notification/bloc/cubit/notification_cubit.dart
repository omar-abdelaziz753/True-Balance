import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/model/notifications_response.dart';
import 'package:truee_balance_app/features/user/notification/notification/data/repo/notification_repo.dart';


part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepo) : super(NotificationInitial());
  final NotificationRepo notificationRepo;
  NotificationsResponse? notificationsResponse;

  Future<void> getNotification() async {
    emit(NotificationLoading());
    final result = await notificationRepo.getNotification();
    result.when(
      success: (data) {
        notificationsResponse = data;
        emit(NotificationSuccess());
      },
      failure: (error) {
        emit(NotificationError());
      },
    );
  }
}
