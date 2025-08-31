// doctor_reviews_models.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';

part 'doctor_reviews_models.g.dart';

/// =======================
/// Top-level response
/// =======================
@JsonSerializable(explicitToJson: true)
class ReviewsResponse {
  final ReviewsData? data;
  final String? status;
  final String? error;
  final int? code;

  ReviewsResponse({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}

/// =======================
/// Data payload (list + links + meta)
/// =======================
@JsonSerializable(explicitToJson: true)
class ReviewsData {
  /// الحقل اسمه "data" في الـ JSON وهو List من التقييمات
  @JsonKey(name: 'data')
  final List<UserRating>? reviews;

  final PageLinks? links;
  final Meta? meta;

  ReviewsData({
    this.reviews,
    this.links,
    this.meta,
  });

  factory ReviewsData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsDataToJson(this);
}


@JsonSerializable()
class PageLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  PageLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PageLinks.fromJson(Map<String, dynamic> json) =>
      _$PageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinksToJson(this);
}

/// =======================
/// Meta + inner pagination links
/// =======================
@JsonSerializable(explicitToJson: true)
class Meta {
  @JsonKey(name: 'current_page')
  final int? currentPage;

  final int? from;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  /// هذه قائمة الروابط داخل الميتا (label/url/active)
  final List<PaginationLink>? links;

  final String? path;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class PaginationLink {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLink({
    this.url,
    this.label,
    this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinkToJson(this);
}
