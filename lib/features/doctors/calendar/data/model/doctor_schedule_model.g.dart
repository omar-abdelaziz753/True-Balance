// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorScheduleModel _$DoctorScheduleModelFromJson(Map<String, dynamic> json) =>
    DoctorScheduleModel(
      data: json['data'] == null
          ? null
          : DataWrapper.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorScheduleModelToJson(
        DoctorScheduleModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

DataWrapper _$DataWrapperFromJson(Map<String, dynamic> json) => DataWrapper(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorScheduleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataWrapperToJson(DataWrapper instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

DoctorScheduleData _$DoctorScheduleDataFromJson(Map<String, dynamic> json) =>
    DoctorScheduleData(
      id: (json['id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      file: json['file'] as String?,
      doctorEvaluation: json['doctor_evaluation'] as String?,
      doctorEvaluationAt: json['doctor_evaluation_at'] as String?,
      userMessage: json['user_message'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DoctorScheduleDataToJson(DoctorScheduleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor?.toJson(),
      'user': instance.user?.toJson(),
      'file': instance.file,
      'doctor_evaluation': instance.doctorEvaluation,
      'doctor_evaluation_at': instance.doctorEvaluationAt,
      'user_message': instance.userMessage,
      'rating': instance.rating,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      about: json['about'] as String?,
      specialization: json['specialization'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'gender': instance.gender,
      'image': instance.image,
      'phone': instance.phone,
      'about': instance.about,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'rateCount': instance.rateCount,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'type': instance.type,
      'age': instance.age,
      'gender': instance.gender,
    };
