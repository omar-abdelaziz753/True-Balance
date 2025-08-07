// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeSlotsModel _$FreeSlotsModelFromJson(Map<String, dynamic> json) =>
    FreeSlotsModel(
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$FreeSlotsModelToJson(FreeSlotsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };
