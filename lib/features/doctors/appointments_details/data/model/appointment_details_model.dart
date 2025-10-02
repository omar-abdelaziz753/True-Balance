import 'package:json_annotation/json_annotation.dart';

part 'appointment_details_model.g.dart';

@JsonSerializable()
class AppointmentDetailsModel {
  final AppointmentDataContainer? data;
  final String? status;
  final String? error;
  final int? code;

  AppointmentDetailsModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailsModelToJson(this);
}

@JsonSerializable()
class AppointmentDataContainer {
  final List<AppointmentData>? data;
  final LinksModel? links;
  final MetaModel? meta;

  AppointmentDataContainer({this.data, this.links, this.meta});

  factory AppointmentDataContainer.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDataContainerToJson(this);
}

@JsonSerializable()
class AppointmentData {
  final int? id;
  final DoctorModel? doctor;
  final dynamic file;
  @JsonKey(name: 'doctor_evaluation')
  final dynamic doctorEvaluation;
  final dynamic doctorEvaluationAt;
  @JsonKey(name: 'user_message')
  final dynamic userMessage;
  final dynamic rating;
  final String? date;
  final String? time;
  final String? status;

  AppointmentData({
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

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDataToJson(this);
}

@JsonSerializable()
class DoctorModel {
  final int? id;
  final String? name;
  final String? email;
  final int? age;
  final String? gender;
  final String? image;
  final String? phone;
  final String? specialization;
  final int? rate;
  final int? rateCount;

  DoctorModel({
    this.id,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.image,
    this.phone,
    this.specialization,
    this.rate,
    this.rateCount,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

@JsonSerializable()
class LinksModel {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  LinksModel({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}

@JsonSerializable()
class MetaModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? from;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  final List<PageLink>? links;
  final String? path;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? to;
  final int? total;

  MetaModel({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@JsonSerializable()
class PageLink {
  final String? url;
  final String? label;
  final bool? active;

  PageLink({
    this.url,
    this.label,
    this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) =>
      _$PageLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinkToJson(this);
}
