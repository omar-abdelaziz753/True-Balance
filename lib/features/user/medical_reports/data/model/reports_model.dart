import 'package:json_annotation/json_annotation.dart';

part 'reports_model.g.dart';

@JsonSerializable()
class ReportsModel {
  final List<String> data;
  final String status;
  final String error;
  final int code;

  ReportsModel({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) =>
      _$ReportsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsModelToJson(this);
}
