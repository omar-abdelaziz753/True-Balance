import 'package:json_annotation/json_annotation.dart';

part 'notifications_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationsResponse {
  final NotificationsData? data;
  final String? status;
  final String? error;
  final int? code;

  NotificationsResponse({this.data, this.status, this.error, this.code});

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationsData {
  final NotificationSection? today;
  final NotificationSection? yesterday;
  @JsonKey(name: "last_7_days")
  final NotificationSection? last7Days;
  final OlderNotifications? older;
  @JsonKey(name: "total_unread")
  final int? totalUnread;

  NotificationsData({
    this.today,
    this.yesterday,
    this.last7Days,
    this.older,
    this.totalUnread,
  });

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationSection {
  final int? count;
  final List<NotificationItem>? notifications;

  NotificationSection({this.count, this.notifications});

  factory NotificationSection.fromJson(Map<String, dynamic> json) =>
      _$NotificationSectionFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSectionToJson(this);
}

@JsonSerializable()
class NotificationItem {
  final String? id;
  final String? type;
  final String? title;
  final String? description;
  @JsonKey(name: "created_at")
  final String? createdAtString;

  NotificationItem({
    this.id,
    this.type,
    this.title,
    this.description,
    this.createdAtString,
  });

  /// Helper getter to parse `created_at` into a DateTime if possible
  DateTime? get createdAt {
    try {
      // Try to parse ISO8601 format
      return DateTime.tryParse(createdAtString ?? '')?.toLocal();
    } catch (_) {
      return null;
    }
  }

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OlderNotifications {
  final int? count;
  final List<NotificationItem>? notifications;
  final Pagination? pagination;

  OlderNotifications({this.count, this.notifications, this.pagination});

  factory OlderNotifications.fromJson(Map<String, dynamic> json) =>
      _$OlderNotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$OlderNotificationsToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "last_page")
  final int? lastPage;
  @JsonKey(name: "per_page")
  final int? perPage;
  final int? total;

  Pagination({this.currentPage, this.lastPage, this.perPage, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

// import 'package:json_annotation/json_annotation.dart';
// part 'notifications_response.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class NotificationsResponse {
//   final NotificationsData? data;
//   final String? status;
//   final String? error;
//   final int? code;
//
//   NotificationsResponse({this.data, this.status, this.error, this.code});
//
//   factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
//       _$NotificationsResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class NotificationsData {
//   final NotificationSection? today;
//   final NotificationSection? yesterday;
//   @JsonKey(name: "last_7_days")
//   final NotificationSection? last7Days;
//   final OlderNotifications? older;
//   @JsonKey(name: "total_unread")
//   final int? totalUnread;
//
//   NotificationsData({
//     this.today,
//     this.yesterday,
//     this.last7Days,
//     this.older,
//     this.totalUnread,
//   });
//
//   factory NotificationsData.fromJson(Map<String, dynamic> json) =>
//       _$NotificationsDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NotificationsDataToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class NotificationSection {
//   final int? count;
//   final List<NotificationItem>? notifications;
//
//   NotificationSection({this.count, this.notifications});
//
//   factory NotificationSection.fromJson(Map<String, dynamic> json) =>
//       _$NotificationSectionFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NotificationSectionToJson(this);
// }
//
// @JsonSerializable()
// class NotificationItem {
//   final String? id;
//   final String? type;
//   final String? title;
//   final String? description;
//   @JsonKey(name: "created_at")
//   final String? createdAt;
//
//   NotificationItem({
//     this.id,
//     this.type,
//     this.title,
//     this.description,
//     this.createdAt,
//   });
//
//   factory NotificationItem.fromJson(Map<String, dynamic> json) =>
//       _$NotificationItemFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class OlderNotifications {
//   final int? count;
//   final List<NotificationItem>? notifications;
//   final Pagination? pagination;
//
//   OlderNotifications({this.count, this.notifications, this.pagination});
//
//   factory OlderNotifications.fromJson(Map<String, dynamic> json) =>
//       _$OlderNotificationsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$OlderNotificationsToJson(this);
// }
//
// @JsonSerializable()
// class Pagination {
//   @JsonKey(name: "current_page")
//   final int? currentPage;
//   @JsonKey(name: "last_page")
//   final int? lastPage;
//   @JsonKey(name: "per_page")
//   final int? perPage;
//   final int? total;
//
//   Pagination({this.currentPage, this.lastPage, this.perPage, this.total});
//
//   factory Pagination.fromJson(Map<String, dynamic> json) =>
//       _$PaginationFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PaginationToJson(this);
// }
