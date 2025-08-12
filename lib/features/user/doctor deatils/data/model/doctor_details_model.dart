import 'package:json_annotation/json_annotation.dart';

part 'doctor_details_model.g.dart';

@JsonSerializable()
class DoctorDetailsResponse {
  final DoctorModelDetails data;
  final String status;
  final String error;
  final int code;

  DoctorDetailsResponse({
    required this.data,
    required this.status,
    required this.error,
    required this.code,
  });

  factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailsResponseToJson(this);
}

@JsonSerializable()
class DoctorModelDetails {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String type;
  final String specialization;
  final int rate;
  final int ratesCount;
  final Ratings ratings;

  DoctorModelDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.type,
    required this.specialization,
    required this.rate,
    required this.ratesCount,
    required this.ratings,
  });

  factory DoctorModelDetails.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelDetailsToJson(this);
}

@JsonSerializable()
class Ratings {
  final List<UserRating> ratings;

  Ratings({required this.ratings});

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}

@JsonSerializable()
class UserRating {
  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'user_image')
  final String? userImage;

  @JsonKey(name: 'user_rate')
  final int? userRate;

  @JsonKey(name: 'user_message')
  final String? userMessage;

  final String? date;

  UserRating({
    required this.userId,
    required this.userName,
    this.userImage,
    required this.userRate,
    required this.userMessage,
    required this.date,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) =>
      _$UserRatingFromJson(json);

  Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
