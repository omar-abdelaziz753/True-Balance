import 'package:json_annotation/json_annotation.dart';

part 'reports_model.g.dart';

@JsonSerializable()
class ReportsModel {
  final List<ReportData> data;
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

@JsonSerializable()
class ReportData {
  final String file;
  @JsonKey(name: 'created_at')
  final String createdAt;

  ReportData({
    required this.file,
    required this.createdAt,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
}
