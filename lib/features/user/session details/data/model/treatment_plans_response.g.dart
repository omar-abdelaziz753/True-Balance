// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_plans_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentPlansResponse _$TreatmentPlansResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentPlansResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TreatmentPlansResponseToJson(
        TreatmentPlansResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      treatmentPlans: (json['treatment_plans'] as List<dynamic>?)
          ?.map((e) => TreatmentPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalNumberOfSessions:
          (json['total_number_of_sessions'] as num?)?.toInt(),
      therapist: json['therapist'] == null
          ? null
          : Therapist.fromJson(json['therapist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'treatment_plans': instance.treatmentPlans,
      'total_number_of_sessions': instance.totalNumberOfSessions,
      'therapist': instance.therapist,
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

Therapist _$TherapistFromJson(Map<String, dynamic> json) => Therapist(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      specialization: json['specialization'] as String?,
    );

Map<String, dynamic> _$TherapistToJson(Therapist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'specialization': instance.specialization,
    };
