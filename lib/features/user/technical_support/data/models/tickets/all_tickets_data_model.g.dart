// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tickets_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTicketsDataModel _$AllTicketsDataModelFromJson(Map<String, dynamic> json) =>
    AllTicketsDataModel(
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : TicketsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllTicketsDataModelToJson(
        AllTicketsDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
      'data': instance.data,
    };

TicketsData _$TicketsDataFromJson(Map<String, dynamic> json) => TicketsData(
      tickets: (json['data'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsDataToJson(TicketsData instance) =>
    <String, dynamic>{
      'data': instance.tickets,
      'links': instance.links,
      'meta': instance.meta,
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
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

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
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

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => MetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

MetaLink _$MetaLinkFromJson(Map<String, dynamic> json) => MetaLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$MetaLinkToJson(MetaLink instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
