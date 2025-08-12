import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final UserData? data;
  final String? status;
  final String? error;
  final int? code;

  UserDataModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;
  final String? type;

  UserData({
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
