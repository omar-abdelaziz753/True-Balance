// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_therapist_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTherapistDataModel _$AllTherapistDataModelFromJson(
        Map<String, dynamic> json) =>
    AllTherapistDataModel(
      data: json['data'] == null
          ? null
          : AllTherapistData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllTherapistDataModelToJson(
        AllTherapistDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

AllTherapistData _$AllTherapistDataFromJson(Map<String, dynamic> json) =>
    AllTherapistData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Therapist.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : TherapistLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : TherapistMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllTherapistDataToJson(AllTherapistData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

Therapist _$TherapistFromJson(Map<String, dynamic> json) => Therapist(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      specialization: json['specialization'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      ratesCount: (json['ratesCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TherapistToJson(Therapist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'type': instance.type,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'ratesCount': instance.ratesCount,
    };

TherapistLinks _$TherapistLinksFromJson(Map<String, dynamic> json) =>
    TherapistLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$TherapistLinksToJson(TherapistLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

TherapistMeta _$TherapistMetaFromJson(Map<String, dynamic> json) =>
    TherapistMeta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => TherapistMetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TherapistMetaToJson(TherapistMeta instance) =>
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

TherapistMetaLink _$TherapistMetaLinkFromJson(Map<String, dynamic> json) =>
    TherapistMetaLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$TherapistMetaLinkToJson(TherapistMetaLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
