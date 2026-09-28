import 'package:json_annotation/json_annotation.dart';

part 'therapist_schedule_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TherapistScheduleModel {
  @JsonKey(name: "data")
  final TherapistScheduleDataWrapper? data;

  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "error")
  final String? error;

  @JsonKey(name: "code")
  final int? code;

  TherapistScheduleModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory TherapistScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistScheduleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TherapistScheduleDataWrapper {
  @JsonKey(name: "data")
  final List<TherapistSchedule>? data;

  TherapistScheduleDataWrapper({this.data});

  factory TherapistScheduleDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$TherapistScheduleDataWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistScheduleDataWrapperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TherapistSchedule {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "treatment_plan_id")
  final int? treatmentPlanId;

  @JsonKey(name: "date")
  final String? date;

  final UserModel? user;

  @JsonKey(name: "time")
  final String? time;

  @JsonKey(name: "notes")
  final String? notes;

  @JsonKey(name: "file")
  final String? file;

  @JsonKey(name: "rating")
  final int? rating;

  @JsonKey(name: "review")
  final String? review;

  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "treatment_plan")
  final TreatmentPlan? treatmentPlan;

  TherapistSchedule({
    this.id,
    this.treatmentPlanId,
    this.date,
    this.user,
    this.time,
    this.notes,
    this.file,
    this.rating,
    this.review,
    this.status,
    this.treatmentPlan,
  });

  factory TherapistSchedule.fromJson(Map<String, dynamic> json) =>
      _$TherapistScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistScheduleToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "number_of_sessions")
  final int? numberOfSessions;

  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "sessions")
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
class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? type;
  final int? age;
  final String? gender;
  UserModel({
    this.age,
    this.gender,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
