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

/// Mark All Notifications as Read
final class NotificationMarkAllAsReadLoading extends NotificationState {}

final class NotificationMarkAllAsReadSuccess extends NotificationState {}

final class NotificationMarkAllAsReadError extends NotificationState {}

/// Mark Single Notification as Read
final class NotificationMarkSingleAsReadLoading extends NotificationState {}

final class NotificationMarkSingleAsReadSuccess extends NotificationState {}

final class NotificationMarkSingleAsReadError extends NotificationState {}

/// Delete Single Notification
final class NotificationDeleteSingleLoading extends NotificationState {}

final class NotificationDeleteSingleSuccess extends NotificationState {}

final class NotificationDeleteSingleError extends NotificationState {}
