// import 'package:json_annotation/json_annotation.dart';

// part 'doctor_details_model.g.dart';

// @JsonSerializable()
// class DoctorDetailsResponse {
//   final DoctorModelDetails data;
//   final String status;
//   final String error;
//   final int code;

//   DoctorDetailsResponse({
//     required this.data,
//     required this.status,
//     required this.error,
//     required this.code,
//   });

//   factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) =>
//       _$DoctorDetailsResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$DoctorDetailsResponseToJson(this);
// }

// @JsonSerializable()
// class DoctorModelDetails {
//   final int id;
//   final String name;
//   final String email;
//   final String image;
//   final String phone;
//   final String type;
//   final String specialization;
//   final int rate;
//   final int ratesCount;
//   final Ratings ratings;
//  final num age;
//   final String gender;
//   DoctorModelDetails({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.image,
//     required this.phone,
//     required this.type,
//     required this.specialization,
//     required this.rate,
//     required this.ratesCount,
//     required this.ratings,
//     required this .age ,
//     required this.gender

//   });

//   factory DoctorModelDetails.fromJson(Map<String, dynamic> json) =>
//       _$DoctorModelDetailsFromJson(json);

//   Map<String, dynamic> toJson() => _$DoctorModelDetailsToJson(this);
// }

// @JsonSerializable()
// class Ratings {
//   final List<UserRating> ratings;

//   Ratings({required this.ratings});

//   factory Ratings.fromJson(Map<String, dynamic> json) =>
//       _$RatingsFromJson(json);

//   Map<String, dynamic> toJson() => _$RatingsToJson(this);
// }

// @JsonSerializable()
// class UserRating {
//   @JsonKey(name: 'user_id')
//   final int? userId;

//   @JsonKey(name: 'user_name')
//   final String? userName;

//   @JsonKey(name: 'user_image')
//   final String? userImage;

//   @JsonKey(name: 'user_rate')
//   final int? userRate;

//   @JsonKey(name: 'user_message')
//   final String? userMessage;

//   final String? date;

//   UserRating({
//     required this.userId,
//     required this.userName,
//     this.userImage,
//     required this.userRate,
//     required this.userMessage,
//     required this.date,
//   });

//   factory UserRating.fromJson(Map<String, dynamic> json) =>
//       _$UserRatingFromJson(json);

//   Map<String, dynamic> toJson() => _$UserRatingToJson(this);
// }
import 'package:json_annotation/json_annotation.dart';

part 'doctor_details_model.g.dart';

@JsonSerializable()
class DoctorDetailsResponse {
  final DoctorModelDetails? data;
  final String? status;
  final String? error;
  final int? code;

  DoctorDetailsResponse({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailsResponseToJson(this);
}

@JsonSerializable()
class DoctorModelDetails {
  final int? id;
  final String? name;
  final String? email;
  final int? age;
  final String? gender;
  final String? image;
  final String? phone;
  final String? about;
  final String? type;
  final String? specialization;
  final num? rate;
  final int? rateCount;
  final Ratings? ratings;
  final double? consultationPrice;
  final double? sessionPrice;

  DoctorModelDetails({
    this.id,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.image,
    this.phone,
    this.about,
    this.type,
    this.specialization,
    this.rate,
    this.rateCount,
    this.ratings,
    this.consultationPrice,
    this.sessionPrice,
  });

  factory DoctorModelDetails.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelDetailsToJson(this);
}

@JsonSerializable()
class Ratings {
  final List<UserRating>? ratings;

  Ratings({this.ratings});

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

  // New API fields support
  final int? id;
  final String? name;
  final String? text;
  final String? image;
  final int? rating;

  final String? date;

  UserRating({
    this.userId,
    this.userName,
    this.userImage,
    this.userRate,
    this.userMessage,
    this.date,
    this.id,
    this.name,
    this.text,
    this.image,
    this.rating,
  });

  // Factory to create from new API format (id, name, text, rating)
  factory UserRating.fromNewApi(Map<String, dynamic> json) {
    return UserRating(
      id: json['id'] as int?,
      name: json['name'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] as int?,
      date: json['date'] as String?,
    );
  }

  factory UserRating.fromJson(Map<String, dynamic> json) {
    // Check if it's new format (has 'id' field) or old format (has 'user_id')
    if (json['id'] != null && json['user_id'] == null) {
      return UserRating(
        id: json['id'] as int?,
        name: json['name'] as String?,
        text: json['text'] as String?,
        image: json['image'] as String?,
        rating: json['rating'] as int?,
        date: json['date'] as String?,
      );
    }
    // Old format
    return UserRating(
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      userImage: json['user_image'] as String?,
      userRate: json['user_rate'] as int?,
      userMessage: json['user_message'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
