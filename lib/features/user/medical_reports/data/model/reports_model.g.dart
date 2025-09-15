// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsModel _$ReportsModelFromJson(Map<String, dynamic> json) => ReportsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => ReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$ReportsModelToJson(ReportsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

ReportData _$ReportDataFromJson(Map<String, dynamic> json) => ReportData(
      file: json['file'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ReportDataToJson(ReportData instance) =>
    <String, dynamic>{
      'file': instance.file,
      'created_at': instance.createdAt,
    };
