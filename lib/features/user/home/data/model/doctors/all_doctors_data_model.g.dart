// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_doctors_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsDataModel _$AllDoctorsDataModelFromJson(Map<String, dynamic> json) =>
    AllDoctorsDataModel(
      data: DoctorsResponseData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$AllDoctorsDataModelToJson(
        AllDoctorsDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

DoctorsResponseData _$DoctorsResponseDataFromJson(Map<String, dynamic> json) =>
    DoctorsResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorsResponseDataToJson(
        DoctorsResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      specialization: json['specialization'] as String,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'type': instance.type,
      'specialization': instance.specialization,
    };

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    PaginationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PaginationLinksToJson(PaginationLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) =>
    PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PaginationLinkToJson(PaginationLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
