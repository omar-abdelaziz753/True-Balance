// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistScheduleModel _$TherapistScheduleModelFromJson(
        Map<String, dynamic> json) =>
    TherapistScheduleModel(
      data: json['data'] == null
          ? null
          : TherapistScheduleDataWrapper.fromJson(
              json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TherapistScheduleModelToJson(
        TherapistScheduleModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

TherapistScheduleDataWrapper _$TherapistScheduleDataWrapperFromJson(
        Map<String, dynamic> json) =>
    TherapistScheduleDataWrapper(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TherapistSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TherapistScheduleDataWrapperToJson(
        TherapistScheduleDataWrapper instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

TherapistSchedule _$TherapistScheduleFromJson(Map<String, dynamic> json) =>
    TherapistSchedule(
      id: (json['id'] as num?)?.toInt(),
      treatmentPlanId: (json['treatment_plan_id'] as num?)?.toInt(),
      date: json['date'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      time: json['time'] as String?,
      notes: json['notes'] as String?,
      file: json['file'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      review: json['review'] as String?,
      status: json['status'] as String?,
      treatmentPlan: json['treatment_plan'] == null
          ? null
          : TreatmentPlan.fromJson(
              json['treatment_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TherapistScheduleToJson(TherapistSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treatment_plan_id': instance.treatmentPlanId,
      'date': instance.date,
      'user': instance.user?.toJson(),
      'time': instance.time,
      'notes': instance.notes,
      'file': instance.file,
      'rating': instance.rating,
      'review': instance.review,
      'status': instance.status,
      'treatment_plan': instance.treatmentPlan?.toJson(),
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

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'type': instance.type,
      'age': instance.age,
      'gender': instance.gender,
    };
