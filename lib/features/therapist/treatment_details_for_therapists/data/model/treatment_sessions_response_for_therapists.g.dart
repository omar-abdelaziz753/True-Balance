// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_sessions_response_for_therapists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentSessionsResponseForTherapists
    _$TreatmentSessionsResponseForTherapistsFromJson(
            Map<String, dynamic> json) =>
        TreatmentSessionsResponseForTherapists(
          data: json['data'] == null
              ? null
              : TreatmentSessionsData.fromJson(
                  json['data'] as Map<String, dynamic>),
          status: json['status'] as String?,
          error: json['error'] as String?,
          code: (json['code'] as num?)?.toInt(),
        );

Map<String, dynamic> _$TreatmentSessionsResponseForTherapistsToJson(
        TreatmentSessionsResponseForTherapists instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

TreatmentSessionsData _$TreatmentSessionsDataFromJson(
        Map<String, dynamic> json) =>
    TreatmentSessionsData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TreatmentSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TreatmentSessionsDataToJson(
        TreatmentSessionsData instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

TreatmentSession _$TreatmentSessionFromJson(Map<String, dynamic> json) =>
    TreatmentSession(
      id: (json['id'] as num?)?.toInt(),
      treatmentPlanId: (json['treatment_plan_id'] as num?)?.toInt(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      notes: json['notes'] as String?,
      file: json['file'] as String?,
      rating: json['rating'],
      review: json['review'],
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TreatmentSessionToJson(TreatmentSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treatment_plan_id': instance.treatmentPlanId,
      'date': instance.date,
      'time': instance.time,
      'notes': instance.notes,
      'file': instance.file,
      'rating': instance.rating,
      'review': instance.review,
      'status': instance.status,
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
      'links': instance.links?.map((e) => e.toJson()).toList(),
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
