import 'package:json_annotation/json_annotation.dart';

part 'consultations_response.g.dart';

@JsonSerializable()
class ConsultationsResponse {
  final ConsultationsData data;
  final String status;
  final String error;
  final int code;

  ConsultationsResponse({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory ConsultationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationsResponseToJson(this);
}

@JsonSerializable()
class ConsultationsData {
  final List<Consultation> data;
  final Links links;
  final Meta meta;

  ConsultationsData({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory ConsultationsData.fromJson(Map<String, dynamic> json) =>
      _$ConsultationsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationsDataToJson(this);
}

@JsonSerializable()
class Consultation {
  final int id;
  final Doctor doctor;

  @JsonKey(name: 'recovery_rate')
  final int? recoveryRate;

  @JsonKey(name: 'doctor_evaluation')
  final String? doctorEvaluation;

  @JsonKey(name: 'doctor_evaluation_at')
  final String? doctorEvaluationAt;

  @JsonKey(name: 'user_message')
  final String? userMessage;

  final int? rating;
  final String date;
  final String time;
  final String status;

  Consultation({
    required this.id,
    required this.doctor,
    this.recoveryRate,
    this.doctorEvaluation,
    this.doctorEvaluationAt,
    this.userMessage,
    this.rating,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationToJson(this);
}

@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String specialization;
  final int rate;
  final int rateCount;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.specialization,
    required this.rate,
    required this.rateCount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) =>
      _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int currentPage;

  final int from;

  @JsonKey(name: 'last_page')
  final int lastPage;

  final List<PageLink> links;
  final String path;

  @JsonKey(name: 'per_page')
  final int perPage;

  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) =>
      _$PageLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinkToJson(this);
}
