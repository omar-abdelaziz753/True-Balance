// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => SliderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

SliderItem _$SliderItemFromJson(Map<String, dynamic> json) => SliderItem(
      id: (json['id'] as num).toInt(),
      background: json['background'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      btnTitle: json['btnTitle'] as String,
      btnUrl: json['btnUrl'] as String,
      btnActive: json['btnActive'] as String,
    );

Map<String, dynamic> _$SliderItemToJson(SliderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'background': instance.background,
      'title': instance.title,
      'text': instance.text,
      'btnTitle': instance.btnTitle,
      'btnUrl': instance.btnUrl,
      'btnActive': instance.btnActive,
    };
