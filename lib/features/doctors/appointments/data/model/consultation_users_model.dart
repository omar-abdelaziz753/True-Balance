import 'package:json_annotation/json_annotation.dart';

part 'consultation_users_model.g.dart';

@JsonSerializable()
class ConsultationUsersResponse {
  final ConsultationUsersData? data;
  final String? status;
  final String? error;
  final int? code;

  ConsultationUsersResponse({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory ConsultationUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationUsersResponseToJson(this);
}

@JsonSerializable()
class ConsultationUsersData {
  final List<UserData>? data;
  final Links? links;
  final Meta? meta;

  ConsultationUsersData({
    this.data,
    this.links,
    this.meta,
  });

  factory ConsultationUsersData.fromJson(Map<String, dynamic> json) =>
      _$ConsultationUsersDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationUsersDataToJson(this);
}

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;
  final String? gender;
  final int? age;
  final String? type;

  UserData(
    this.gender,
    this.age, {
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
    this.type,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
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

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  final List<MetaLink>? links;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class MetaLink {
  final String? url;
  final String? label;
  final bool? active;

  MetaLink({
    this.url,
    this.label,
    this.active,
  });

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLinkToJson(this);
}
