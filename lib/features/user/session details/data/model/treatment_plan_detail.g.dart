// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_plan_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentPlanDetail _$TreatmentPlanDetailFromJson(Map<String, dynamic> json) =>
    TreatmentPlanDetail(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      client: json['client'] as Map<String, dynamic>,
      therapist: Therapist.fromJson(json['therapist'] as Map<String, dynamic>),
      numberOfSessions: (json['number_of_sessions'] as num).toInt(),
      type: json['type'] as String,
      description: json['description'] as String?,
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedSessions: (json['completed_sessions'] as num).toInt(),
      uncompletedSessions: (json['uncompleted_sessions'] as num).toInt(),
      totalSessions: (json['total_sessions'] as num).toInt(),
      availableAppointments: (json['available_appointments'] as List<dynamic>)
          .map((e) => AvailableAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreatmentPlanDetailToJson(
        TreatmentPlanDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'client': instance.client,
      'therapist': instance.therapist.toJson(),
      'number_of_sessions': instance.numberOfSessions,
      'type': instance.type,
      'description': instance.description,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'completed_sessions': instance.completedSessions,
      'uncompleted_sessions': instance.uncompletedSessions,
      'total_sessions': instance.totalSessions,
      'available_appointments':
          instance.availableAppointments.map((e) => e.toJson()).toList(),
    };

Therapist _$TherapistFromJson(Map<String, dynamic> json) => Therapist(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      specialization: json['specialization'] as String,
      rate: (json['rate'] as num).toInt(),
      rateCount: (json['rateCount'] as num).toInt(),
    );

Map<String, dynamic> _$TherapistToJson(Therapist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'type': instance.type,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'rateCount': instance.rateCount,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: (json['id'] as num).toInt(),
      treatmentPlanId: (json['treatment_plan_id'] as num).toInt(),
      date: json['date'] as String,
      time: json['time'] as String,
      notes: json['notes'] as String?,
      file: json['file'] as String?,
      rating: json['rating'] as String?,
      review: json['review'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'treatment_plan_id': instance.treatmentPlanId,
      'date': instance.date,
      'time': instance.time,
      'notes': instance.notes,
      'file': instance.file,
      'rating': instance.rating,
      'review': instance.review,
      'status': instance.status,
    };

AvailableAppointment _$AvailableAppointmentFromJson(
        Map<String, dynamic> json) =>
    AvailableAppointment(
      day: json['day'] as String,
      slots: (json['slots'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AvailableAppointmentToJson(
        AvailableAppointment instance) =>
    <String, dynamic>{
      'day': instance.day,
      'slots': instance.slots,
    };
