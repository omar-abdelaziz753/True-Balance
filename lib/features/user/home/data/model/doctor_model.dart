import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorResponse {
  final DoctorData data;
  final String status;
  final String error;
  final int code;

  DoctorResponse({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) => _$DoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}

@JsonSerializable()
class DoctorData {
  final List<Doctor> data;
  final PaginationLinks links;
  final PaginationMeta meta;

  DoctorData({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => _$DoctorDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
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
  final int ratesCount;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.specialization,
    required this.rate,
    required this.ratesCount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class PaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  PaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationLinksToJson(this);
}

@JsonSerializable()
class PaginationMeta {
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

  PaginationMeta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
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

  factory PageLink.fromJson(Map<String, dynamic> json) => _$PageLinkFromJson(json);
  Map<String, dynamic> toJson() => _$PageLinkToJson(this);
}
