// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDetailsDataModel _$TicketDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    TicketDetailsDataModel(
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : TicketData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketDetailsDataModelToJson(
        TicketDetailsDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
      'data': instance.data,
    };

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      client: json['client'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketDataToJson(TicketData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'client': instance.client,
      'email': instance.email,
      'image': instance.image,
      'status': instance.status,
      'priority': instance.priority,
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      message: json['message'] as String?,
      isAdmin: (json['is_admin'] as num?)?.toInt(),
      employee: json['employee'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'message': instance.message,
      'is_admin': instance.isAdmin,
      'employee': instance.employee,
    };
