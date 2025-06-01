import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';
@JsonSerializable()
class UserDataModel {
  final UserData data;
  final String status;
  final String error;
  final int code;

  UserDataModel({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}


@JsonSerializable()
class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
