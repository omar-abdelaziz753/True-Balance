// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsModel _$AboutUsModelFromJson(Map<String, dynamic> json) => AboutUsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AboutUsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AboutUsModelToJson(AboutUsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

AboutUsData _$AboutUsDataFromJson(Map<String, dynamic> json) => AboutUsData(
      name: json['name'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AboutUsDataToJson(AboutUsData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
    };
