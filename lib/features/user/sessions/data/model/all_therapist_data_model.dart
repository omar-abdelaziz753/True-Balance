import 'package:json_annotation/json_annotation.dart';

part 'all_therapist_data_model.g.dart';

@JsonSerializable()
class AllTherapistDataModel {
  final AllTherapistData? data;
  final String? status;
  final String? error;
  final int? code;

  AllTherapistDataModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory AllTherapistDataModel.fromJson(Map<String, dynamic> json) =>
      _$AllTherapistDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllTherapistDataModelToJson(this);
}

@JsonSerializable()
class AllTherapistData {
  final List<Therapist>? data;
  final TherapistLinks? links;
  final TherapistMeta? meta;

  AllTherapistData({
    this.data,
    this.links,
    this.meta,
  });

  factory AllTherapistData.fromJson(Map<String, dynamic> json) =>
      _$AllTherapistDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllTherapistDataToJson(this);
}

@JsonSerializable()
class Therapist {
  final int? id;
  final String? name;
  final String? email;
  final String? image;
  final String? phone;
  final String? type;
  final String? specialization;
  final double? rate;
  final int? ratesCount;

  Therapist({
    this.id,
    this.name,
    this.email,
    this.image,
    this.phone,
    this.type,
    this.specialization,
    this.rate,
    this.ratesCount,
  });

  factory Therapist.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}

@JsonSerializable()
class TherapistLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  TherapistLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory TherapistLinks.fromJson(Map<String, dynamic> json) =>
      _$TherapistLinksFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistLinksToJson(this);
}

@JsonSerializable()
class TherapistMeta {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  final List<TherapistMetaLink>? links;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? to;
  final int? total;

  TherapistMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory TherapistMeta.fromJson(Map<String, dynamic> json) =>
      _$TherapistMetaFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistMetaToJson(this);
}

@JsonSerializable()
class TherapistMetaLink {
  final String? url;
  final String? label;
  final bool? active;

  TherapistMetaLink({
    this.url,
    this.label,
    this.active,
  });

  factory TherapistMetaLink.fromJson(Map<String, dynamic> json) =>
      _$TherapistMetaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistMetaLinkToJson(this);
}
