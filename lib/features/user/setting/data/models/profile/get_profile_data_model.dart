import 'package:json_annotation/json_annotation.dart';

part 'get_profile_data_model.g.dart';

@JsonSerializable()
class GetProfileDataModel {
  final ProfileData? data;
  final String? status;
  final String? error;
  final int? code;

  GetProfileDataModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory GetProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileDataModelToJson(this);
}

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? type;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.type,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
