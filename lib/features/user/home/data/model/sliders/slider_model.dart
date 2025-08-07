import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  final List<SliderItem> data;
  final String status;
  final String error;
  final int code;

  SliderModel({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}

@JsonSerializable()
class SliderItem {
  final int id;
  final String background;
  final String title;
  final String text;
  final String btnTitle;
  final String btnUrl;
  final String btnActive;

  SliderItem({
    required this.id,
    required this.background,
    required this.title,
    required this.text,
    required this.btnTitle,
    required this.btnUrl,
    required this.btnActive,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) =>
      _$SliderItemFromJson(json);

  Map<String, dynamic> toJson() => _$SliderItemToJson(this);
}
