part of 'notification_cubit.dart';

abstract class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {}

final class NotificationError extends NotificationState {}

final class NotificationLoadingMore extends NotificationState {}

/// Delete All Notifications
final class NotificationDeletedLoading extends NotificationState {}

final class NotificationDeletedSuccess extends NotificationState {}

final class NotificationDeletedError extends NotificationState {}