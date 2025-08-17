  import 'package:json_annotation/json_annotation.dart';

  part 'about_us_model.g.dart';

  @JsonSerializable()
  class AboutUsModel {
    final List<AboutUsData>? data;
    final String? status;
    final String? error;
    final int? code;

    AboutUsModel({
      this.data,
      this.status,
      this.error,
      this.code,
    });

    factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
        _$AboutUsModelFromJson(json);

    Map<String, dynamic> toJson() => _$AboutUsModelToJson(this);
  }

  @JsonSerializable()
  class AboutUsData {
    final String? name;
    final String? title;
    final String? text;
    final String? image;

    AboutUsData({
      this.name,
      this.title,
      this.text,
      this.image,
    });

    factory AboutUsData.fromJson(Map<String, dynamic> json) =>
        _$AboutUsDataFromJson(json);

    Map<String, dynamic> toJson() => _$AboutUsDataToJson(this);
  }
