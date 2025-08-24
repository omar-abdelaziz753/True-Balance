// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) =>
    PrivacyPolicyModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PrivacyPolicyData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrivacyPolicyModelToJson(PrivacyPolicyModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

PrivacyPolicyData _$PrivacyPolicyDataFromJson(Map<String, dynamic> json) =>
    PrivacyPolicyData(
      name: json['name'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$PrivacyPolicyDataToJson(PrivacyPolicyData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
    };
