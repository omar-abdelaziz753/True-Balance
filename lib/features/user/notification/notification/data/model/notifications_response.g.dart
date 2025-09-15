// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      data: json['data'] == null
          ? null
          : NotificationsData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

NotificationsData _$NotificationsDataFromJson(Map<String, dynamic> json) =>
    NotificationsData(
      today: json['today'] == null
          ? null
          : NotificationSection.fromJson(json['today'] as Map<String, dynamic>),
      yesterday: json['yesterday'] == null
          ? null
          : NotificationSection.fromJson(
              json['yesterday'] as Map<String, dynamic>),
      last7Days: json['last_7_days'] == null
          ? null
          : NotificationSection.fromJson(
              json['last_7_days'] as Map<String, dynamic>),
      older: json['older'] == null
          ? null
          : OlderNotifications.fromJson(json['older'] as Map<String, dynamic>),
      totalUnread: (json['total_unread'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationsDataToJson(NotificationsData instance) =>
    <String, dynamic>{
      'today': instance.today?.toJson(),
      'yesterday': instance.yesterday?.toJson(),
      'last_7_days': instance.last7Days?.toJson(),
      'older': instance.older?.toJson(),
      'total_unread': instance.totalUnread,
    };

NotificationSection _$NotificationSectionFromJson(Map<String, dynamic> json) =>
    NotificationSection(
      count: (json['count'] as num?)?.toInt(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationSectionToJson(
        NotificationSection instance) =>
    <String, dynamic>{
      'count': instance.count,
      'notifications': instance.notifications?.map((e) => e.toJson()).toList(),
    };

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    NotificationItem(
      id: json['id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

OlderNotifications _$OlderNotificationsFromJson(Map<String, dynamic> json) =>
    OlderNotifications(
      count: (json['count'] as num?)?.toInt(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OlderNotificationsToJson(OlderNotifications instance) =>
    <String, dynamic>{
      'count': instance.count,
      'notifications': instance.notifications?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
