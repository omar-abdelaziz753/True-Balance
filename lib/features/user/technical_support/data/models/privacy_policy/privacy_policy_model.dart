import 'package:json_annotation/json_annotation.dart';

part 'privacy_policy_model.g.dart';

@JsonSerializable()
class PrivacyPolicyModel {
  final List<PrivacyPolicyData>? data;
  final String? status;
  final String? error;
  final int? code;

  PrivacyPolicyModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyModelToJson(this);
}

@JsonSerializable()
class PrivacyPolicyData {
  final String? name;
  final String? title;
  final String? text;
  final String? image;

  PrivacyPolicyData({
    this.name,
    this.title,
    this.text,
    this.image,
  });

  factory PrivacyPolicyData.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyDataToJson(this);
}
