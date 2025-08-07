import 'package:json_annotation/json_annotation.dart';

part 'free_slots_model.g.dart';

@JsonSerializable()
class FreeSlotsModel {
  final List<String> data;
  final String status;
  final String error;
  final int code;

  FreeSlotsModel({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory FreeSlotsModel.fromJson(Map<String, dynamic> json) =>
      _$FreeSlotsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FreeSlotsModelToJson(this);
}
