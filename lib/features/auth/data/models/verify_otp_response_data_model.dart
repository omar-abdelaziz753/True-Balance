import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_data_model.g.dart';

@JsonSerializable()
class VerifyOTPResponseDataModel {
  final VerifyOTPData? data;
  final String? status;
  final String? error;
  final int? code;

  VerifyOTPResponseDataModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory VerifyOTPResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPResponseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPResponseDataModelToJson(this);
}

@JsonSerializable()
class VerifyOTPData {
  final String? token;
  final VerifyOTPUser? user;

  VerifyOTPData({
    this.token,
    this.user,
  });

  factory VerifyOTPData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPDataToJson(this);
}

@JsonSerializable()
class VerifyOTPUser {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;
  final String? type;

  VerifyOTPUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
    this.type,
  });

  factory VerifyOTPUser.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPUserFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPUserToJson(this);
}
