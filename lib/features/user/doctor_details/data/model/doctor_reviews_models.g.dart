// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_reviews_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      data: json['data'] == null
          ? null
          : ReviewsData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReviewsResponseToJson(ReviewsResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

ReviewsData _$ReviewsDataFromJson(Map<String, dynamic> json) => ReviewsData(
      reviews: (json['data'] as List<dynamic>?)
          ?.map((e) => UserRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : PageLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewsDataToJson(ReviewsData instance) =>
    <String, dynamic>{
      'data': instance.reviews?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

PageLinks _$PageLinksFromJson(Map<String, dynamic> json) => PageLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PageLinksToJson(PageLinks instance) => <String, dynamic>{
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
          ?.map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
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

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) =>
    PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$PaginationLinkToJson(PaginationLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
