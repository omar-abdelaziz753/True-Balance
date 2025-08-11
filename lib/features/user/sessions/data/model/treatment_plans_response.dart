import 'package:json_annotation/json_annotation.dart';

part 'treatment_plans_response.g.dart';

@JsonSerializable()
class TreatmentPlansResponse {
  final Data? data;
  final String? status;
  final String? error;
  final int? code;

  TreatmentPlansResponse({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory TreatmentPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlansResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlansResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'treatment_plans')
  final List<TreatmentPlan>? treatmentPlans;

  @JsonKey(name: 'total_number_of_sessions')
  final int? totalNumberOfSessions;

  final Therapist? therapist;

  Data({
    this.treatmentPlans,
    this.totalNumberOfSessions,
    this.therapist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  final int? id;
  final String? name;

  @JsonKey(name: 'number_of_sessions')
  final int? numberOfSessions;

  final String? type;
  final String? description;
  final String? sessions;

  TreatmentPlan({
    this.id,
    this.name,
    this.numberOfSessions,
    this.type,
    this.description,
    this.sessions,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanToJson(this);
}

@JsonSerializable()
class Therapist {
  final int? id;
  final String? name;
  final String? email;
  final String? image;
  final String? phone;
  final String? specialization;

  Therapist({
    this.id,
    this.name,
    this.email,
    this.image,
    this.phone,
    this.specialization,
  });

  factory Therapist.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}
