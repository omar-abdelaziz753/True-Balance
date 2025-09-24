// import 'package:json_annotation/json_annotation.dart';

// part 'all_doctors_data_model.g.dart';

// @JsonSerializable()
// class AllDoctorsDataModel {
//   final DoctorsResponseData data;
//   final String status;
//   final String error;
//   final int code;

//   AllDoctorsDataModel({
//     required this.data,
//     required this.status,
//     required this.error,
//     required this.code,
//   });

//   factory AllDoctorsDataModel.fromJson(Map<String, dynamic> json) =>
//       _$AllDoctorsDataModelFromJson(json);

//   Map<String, dynamic> toJson() => _$AllDoctorsDataModelToJson(this);
// }

// @JsonSerializable()
// class DoctorsResponseData {
//   final List<DoctorModel> data;
//   final PaginationLinks links;
//   final PaginationMeta meta;

//   DoctorsResponseData({
//     required this.data,
//     required this.links,
//     required this.meta,
//   });

//   factory DoctorsResponseData.fromJson(Map<String, dynamic> json) =>
//       _$DoctorsResponseDataFromJson(json);

//   Map<String, dynamic> toJson() => _$DoctorsResponseDataToJson(this);
// }

// @JsonSerializable()
// class DoctorModel {
//   final int id;
//   final String name;
//   final String email;
//   final String image;
//   final String phone;
//   final String type;
//   final double rate;
//   final double ratesCount;
//   final String specialization;
//   final num age;
//   String? about;

//   final String gender;

//   DoctorModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.image,
//     required this.phone,
//     this.about,
//     required this.rate,
//     required this.ratesCount,
//     required this.type,
//     required this.specialization,
//     required this.age,
//     required this.gender,
//   });

//   factory DoctorModel.fromJson(Map<String, dynamic> json) =>
//       _$DoctorModelFromJson(json);

//   Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
// }

// @JsonSerializable()
// class PaginationLinks {
//   final String? first;
//   final String? last;
//   final String? prev;
//   final String? next;

//   PaginationLinks({
//     this.first,
//     this.last,
//     this.prev,
//     this.next,
//   });

//   factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
//       _$PaginationLinksFromJson(json);

//   Map<String, dynamic> toJson() => _$PaginationLinksToJson(this);
// }

// @JsonSerializable()
// class PaginationMeta {
//   @JsonKey(name: 'current_page')
//   final int currentPage;
//   final int from;
//   @JsonKey(name: 'last_page')
//   final int lastPage;
//   final List<PaginationLink> links;
//   final String path;
//   @JsonKey(name: 'per_page')
//   final int perPage;
//   final int to;
//   final int total;

//   PaginationMeta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.links,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });

//   factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
//       _$PaginationMetaFromJson(json);

//   Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
// }

// @JsonSerializable()
// class PaginationLink {
//   final String? url;
//   final String label;
//   final bool active;

//   PaginationLink({
//     this.url,
//     required this.label,
//     required this.active,
//   });

//   factory PaginationLink.fromJson(Map<String, dynamic> json) =>
//       _$PaginationLinkFromJson(json);

//   Map<String, dynamic> toJson() => _$PaginationLinkToJson(this);
// }
import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_data_model.g.dart';

@JsonSerializable()
class AllDoctorsDataModel {
  final DoctorsResponseData data;
  final String status;
  final String error;
  final int code;

  AllDoctorsDataModel({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory AllDoctorsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllDoctorsDataModelToJson(this);
}

@JsonSerializable()
class DoctorsResponseData {
  final List<DoctorModel> data;
  final PaginationLinks links;
  final PaginationMeta meta;

  DoctorsResponseData({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory DoctorsResponseData.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsResponseDataToJson(this);
}

@JsonSerializable()
class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String type;
  final double rate;

  @JsonKey(name: 'rateCount')
  final double rateCount; 

  final String specialization;
  final num age;
  final String? about;
  final String gender;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    this.about,
    required this.rate,
    required this.rateCount,
    required this.type,
    required this.specialization,
    required this.age,
    required this.gender,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
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

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinksToJson(this);
}

@JsonSerializable()
class PaginationMeta {
  @JsonKey(name: 'current_page')
  final int ? currentPage;
  final int ? from;

  @JsonKey(name: 'last_page')
  final int ? lastPage;

  final List<PaginationLink> ? links;
  final String ? path;

  @JsonKey(name: 'per_page')
  final int  ?perPage;

  final int ?  to;
  final int ? total;

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

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
}

@JsonSerializable()
class PaginationLink {
  final String? url;
  final String label;
  final bool active;

  PaginationLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinkToJson(this);
}
