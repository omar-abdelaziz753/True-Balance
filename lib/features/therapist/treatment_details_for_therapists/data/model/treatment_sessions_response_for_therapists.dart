import 'package:json_annotation/json_annotation.dart';

part 'treatment_sessions_response_for_therapists.g.dart';

@JsonSerializable(explicitToJson: true)
class TreatmentSessionsResponseForTherapists {
  final TreatmentSessionsData? data;
  final String? status;
  final String? error;
  final int? code;

  TreatmentSessionsResponseForTherapists({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory TreatmentSessionsResponseForTherapists.fromJson(Map<String, dynamic> json) =>
      _$TreatmentSessionsResponseForTherapistsFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentSessionsResponseForTherapistsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TreatmentSessionsData {
  final List<TreatmentSession>? data;
  final Links? links;
  final Meta? meta;

  TreatmentSessionsData({
    this.data,
    this.links,
    this.meta,
  });

  factory TreatmentSessionsData.fromJson(Map<String, dynamic> json) =>
      _$TreatmentSessionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentSessionsDataToJson(this);
}

@JsonSerializable()
class TreatmentSession {
  final int? id;
  @JsonKey(name: "treatment_plan_id")
  final int? treatmentPlanId;
  final String? date;
  final String? time;
  final String? notes;
  final String? file;
  final dynamic rating;
  final dynamic review;
  final String? status;

  TreatmentSession({
    this.id,
    this.treatmentPlanId,
    this.date,
    this.time,
    this.notes,
    this.file,
    this.rating,
    this.review,
    this.status,
  });

  factory TreatmentSession.fromJson(Map<String, dynamic> json) =>
      _$TreatmentSessionFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentSessionToJson(this);
}

@JsonSerializable()
class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable(explicitToJson: true)
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

  MetaLink({
    this.url,
    this.label,
    this.active,
  });

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLinkToJson(this);
}
