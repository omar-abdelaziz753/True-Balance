// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileDataModel _$GetProfileDataModelFromJson(Map<String, dynamic> json) =>
    GetProfileDataModel(
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProfileDataModelToJson(
        GetProfileDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      json['gender'] as String?,
      (json['age'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'type': instance.type,
      'gender': instance.gender,
      'age': instance.age,
    };
