// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailsResponse _$DoctorDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorDetailsResponse(
      data: DoctorModelDetails.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorDetailsResponseToJson(
        DoctorDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

DoctorModelDetails _$DoctorModelDetailsFromJson(Map<String, dynamic> json) =>
    DoctorModelDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      specialization: json['specialization'] as String,
      rate: (json['rate'] as num).toInt(),
      ratesCount: (json['ratesCount'] as num).toInt(),
      ratings: Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
      age: json['age'] as num,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$DoctorModelDetailsToJson(DoctorModelDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'type': instance.type,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'ratesCount': instance.ratesCount,
      'ratings': instance.ratings,
      'age': instance.age,
      'gender': instance.gender,
    };

Ratings _$RatingsFromJson(Map<String, dynamic> json) => Ratings(
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => UserRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'ratings': instance.ratings,
    };

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      userId: (json['user_id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      userImage: json['user_image'] as String?,
      userRate: (json['user_rate'] as num?)?.toInt(),
      userMessage: json['user_message'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_image': instance.userImage,
      'user_rate': instance.userRate,
      'user_message': instance.userMessage,
      'date': instance.date,
    };
