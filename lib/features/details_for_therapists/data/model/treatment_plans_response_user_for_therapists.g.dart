// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_plans_response_user_for_therapists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentPlansResponseUserForTherapists
    _$TreatmentPlansResponseUserForTherapistsFromJson(
            Map<String, dynamic> json) =>
        TreatmentPlansResponseUserForTherapists(
          data: json['data'] == null
              ? null
              : TreatmentPlansData.fromJson(
                  json['data'] as Map<String, dynamic>),
          status: json['status'] as String?,
          error: json['error'] as String?,
          code: (json['code'] as num?)?.toInt(),
        );

Map<String, dynamic> _$TreatmentPlansResponseUserForTherapistsToJson(
        TreatmentPlansResponseUserForTherapists instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

TreatmentPlansData _$TreatmentPlansDataFromJson(Map<String, dynamic> json) =>
    TreatmentPlansData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TreatmentPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TreatmentPlansDataToJson(TreatmentPlansData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

TreatmentPlan _$TreatmentPlanFromJson(Map<String, dynamic> json) =>
    TreatmentPlan(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      numberOfSessions: (json['number_of_sessions'] as num?)?.toInt(),
      type: json['type'] as String?,
      description: json['description'] as String?,
      sessions: json['sessions'] as String?,
    );

Map<String, dynamic> _$TreatmentPlanToJson(TreatmentPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number_of_sessions': instance.numberOfSessions,
      'type': instance.type,
      'description': instance.description,
      'sessions': instance.sessions,
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
