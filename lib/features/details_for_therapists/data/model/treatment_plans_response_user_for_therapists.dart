import 'package:json_annotation/json_annotation.dart';

part 'treatment_plans_response_user_for_therapists.g.dart';

@JsonSerializable()
class TreatmentPlansResponseUserForTherapists {
  final TreatmentPlansData? data;
  final String? status;
  final String? error;
  final int? code;

  TreatmentPlansResponseUserForTherapists({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory TreatmentPlansResponseUserForTherapists.fromJson(
          Map<String, dynamic> json) =>
      _$TreatmentPlansResponseUserForTherapistsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TreatmentPlansResponseUserForTherapistsToJson(this);
}

@JsonSerializable()
class TreatmentPlansData {
  final List<TreatmentPlan>? data;
  final Links? links;
  final Meta? meta;

  TreatmentPlansData({this.data, this.links, this.meta});

  factory TreatmentPlansData.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlansDataFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlansDataToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  final int? id;
  final String? name;
  @JsonKey(name: "number_of_sessions")
  final int? numberOfSessions;
  final String? type;
  final String? description;
  final String? sessions;

  TreatmentPlan({
    this.id,
    this.name,
    this.numberOfSessions,
    this.type,
    this.description,
    this.sessions,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanToJson(this);
}

@JsonSerializable()
class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "current_page")
  final int? currentPage;
  final int? from;
  @JsonKey(name: "last_page")
  final int? lastPage;
  final List<MetaLink>? links;
  final String? path;
  @JsonKey(name: "per_page")
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
class MetaLink {
  final String? url;
  final String? label;
  final bool? active;

  MetaLink({this.url, this.label, this.active});

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLinkToJson(this);
}
