import 'package:json_annotation/json_annotation.dart';

part 'ticket_details_data_model.g.dart';

@JsonSerializable()
class TicketDetailsDataModel {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'error')
  String? error;

  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'data')
  TicketData? data;

  TicketDetailsDataModel({
    this.status,
    this.error,
    this.code,
    this.data,
  });

  factory TicketDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDetailsDataModelToJson(this);
}

@JsonSerializable()
class TicketData {
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

  TicketData({
    this.id,
    this.title,
    this.client,
    this.email,
    this.image,
    this.status,
    this.priority,
    this.messages,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
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