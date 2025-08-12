import 'package:json_annotation/json_annotation.dart';

part 'all_tickets_data_model.g.dart';

@JsonSerializable()
class AllTicketsDataModel {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'error')
  String? error;

  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'data')
  TicketsData? data;

  AllTicketsDataModel({
    this.status,
    this.error,
    this.code,
    this.data,
  });

  factory AllTicketsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AllTicketsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllTicketsDataModelToJson(this);
}

@JsonSerializable()
class TicketsData {
  @JsonKey(name: 'data')
  List<Ticket>? tickets;

  @JsonKey(name: 'links')
  Links? links;

  @JsonKey(name: 'meta')
  Meta? meta;

  TicketsData({
    this.tickets,
    this.links,
    this.meta,
  });

  factory TicketsData.fromJson(Map<String, dynamic> json) =>
      _$TicketsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsDataToJson(this);
}

@JsonSerializable()
class Ticket {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'client')
  String? client;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'priority')
  String? priority;

  @JsonKey(name: 'messages')
  List<Message>? messages;

  Ticket({
    this.id,
    this.title,
    this.client,
    this.email,
    this.image,
    this.status,
    this.priority,
    this.messages,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable()
class Message {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'is_admin')
  int? isAdmin;

  @JsonKey(name: 'employee')
  String? employee;

  Message({
    this.message,
    this.isAdmin,
    this.employee,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Links {
  @JsonKey(name: 'first')
  String? first;

  @JsonKey(name: 'last')
  String? last;

  @JsonKey(name: 'prev')
  String? prev;

  @JsonKey(name: 'next')
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  int? currentPage;

  @JsonKey(name: 'from')
  int? from;

  @JsonKey(name: 'last_page')
  int? lastPage;

  @JsonKey(name: 'links')
  List<MetaLink>? links;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'per_page')
  int? perPage;

  @JsonKey(name: 'to')
  int? to;

  @JsonKey(name: 'total')
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class MetaLink {
  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'label')
  String? label;

  @JsonKey(name: 'active')
  bool? active;

  MetaLink({
    this.url,
    this.label,
    this.active,
  });

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLinkToJson(this);
}