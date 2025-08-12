import 'package:json_annotation/json_annotation.dart';

part 'treatment_plan_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class TreatmentPlanDetail {
  final int id;
  final String name;
  final Map<String, dynamic> client;
  final Therapist therapist;

  @JsonKey(name: 'number_of_sessions')
  final int numberOfSessions;

  final String type;
  final String? description;
  List<Session> sessions;

  @JsonKey(name: 'completed_sessions')
  final int completedSessions;

  @JsonKey(name: 'uncompleted_sessions')
  final int uncompletedSessions;

  @JsonKey(name: 'total_sessions')
  final int totalSessions;

  @JsonKey(name: 'available_appointments')
  final List<AvailableAppointment> availableAppointments;

  TreatmentPlanDetail({
    required this.id,
    required this.name,
    required this.client,
    required this.therapist,
    required this.numberOfSessions,
    required this.type,
    this.description,
    required this.sessions,
    required this.completedSessions,
    required this.uncompletedSessions,
    required this.totalSessions,
    required this.availableAppointments,
  });

  factory TreatmentPlanDetail.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanDetailToJson(this);
}

@JsonSerializable()
class Therapist {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String type;
  final String specialization;
  final int rate;
  final int ratesCount;

  Therapist({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.type,
    required this.specialization,
    required this.rate,
    required this.ratesCount,
  });

  factory Therapist.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}

@JsonSerializable()
class Session {
  final int id;

  @JsonKey(ignore: true)
  int? index; // Not part of JSON, set programmatically

  @JsonKey(name: 'treatment_plan_id')
  final int treatmentPlanId;

  final String date;
  final String time;
  final String? notes;
  final String? file;
  final String? rating;
  final String? review;
  final String status;

  Session({
    required this.id,
    this.index,
    required this.treatmentPlanId,
    required this.date,
    required this.time,
    this.notes,
    this.file,
    this.rating,
    this.review,
    required this.status,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class AvailableAppointment {
  final String day;
  final List<String> slots;

  AvailableAppointment({
    required this.day,
    required this.slots,
  });

  factory AvailableAppointment.fromJson(Map<String, dynamic> json) =>
      _$AvailableAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableAppointmentToJson(this);
}
