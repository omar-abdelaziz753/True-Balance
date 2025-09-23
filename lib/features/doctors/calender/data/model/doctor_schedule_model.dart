import 'package:json_annotation/json_annotation.dart';

part 'doctor_schedule_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorScheduleModel {
  @JsonKey(name: "data")
  final DataWrapper? data;

  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "error")
  final String? error;

  @JsonKey(name: "code")
  final int? code;

  DoctorScheduleModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorScheduleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataWrapper {
  @JsonKey(name: "data")
  final List<DoctorScheduleData>? data;

  DataWrapper({this.data});

  factory DataWrapper.fromJson(Map<String, dynamic> json) =>
      _$DataWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$DataWrapperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DoctorScheduleData {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "doctor")
  final Doctor? doctor;

  @JsonKey(name: "file")
  final String? file;

  @JsonKey(name: "doctor_evaluation")
  final String? doctorEvaluation;

  @JsonKey(name: "doctor_evaluation_at")
  final String? doctorEvaluationAt;

  @JsonKey(name: "user_message")
  final String? userMessage;

  @JsonKey(name: "rating")
  final int? rating;

  @JsonKey(name: "date")
  final String? date;

  @JsonKey(name: "time")
  final String? time;

  @JsonKey(name: "status")
  final String? status;

  DoctorScheduleData({
    this.id,
    this.doctor,
    this.file,
    this.doctorEvaluation,
    this.doctorEvaluationAt,
    this.userMessage,
    this.rating,
    this.date,
    this.time,
    this.status,
  });

  factory DoctorScheduleData.fromJson(Map<String, dynamic> json) =>
      _$DoctorScheduleDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorScheduleDataToJson(this);
}

@JsonSerializable()
class Doctor {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "age")
  final int? age;

  @JsonKey(name: "gender")
  final String? gender;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "phone")
  final String? phone;

  @JsonKey(name: "about")
  final String? about;

  @JsonKey(name: "specialization")
  final String? specialization;

  @JsonKey(name: "rate")
  final int? rate;

  @JsonKey(name: "rateCount")
  final int? rateCount;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.image,
    this.phone,
    this.about,
    this.specialization,
    this.rate,
    this.rateCount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
