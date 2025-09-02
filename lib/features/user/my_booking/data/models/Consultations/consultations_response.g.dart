// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationsResponse _$ConsultationsResponseFromJson(
        Map<String, dynamic> json) =>
    ConsultationsResponse(
      data: ConsultationsData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      error: json['error'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$ConsultationsResponseToJson(
        ConsultationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

ConsultationsData _$ConsultationsDataFromJson(Map<String, dynamic> json) =>
    ConsultationsData(
      data: (json['data'] as List<dynamic>)
          .map((e) => Consultation.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConsultationsDataToJson(ConsultationsData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

Consultation _$ConsultationFromJson(Map<String, dynamic> json) => Consultation(
      id: (json['id'] as num).toInt(),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      file: json['file'] as String?,
      doctorEvaluation: json['doctor_evaluation'] as String?,
      doctorEvaluationAt: json['doctor_evaluation_at'] as String?,
      userMessage: json['user_message'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ConsultationToJson(Consultation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
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
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      phone: json['phone'] as String,
      specialization: json['specialization'] as String,
      rate: (json['rate'] as num).toInt(),
      rateCount: (json['rateCount'] as num).toInt(),
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'rateCount': instance.rateCount,
      'age': instance.age,
      'gender': instance.gender,
      'about': instance.about,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>)
          .map((e) => PageLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

PageLink _$PageLinkFromJson(Map<String, dynamic> json) => PageLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PageLinkToJson(PageLink instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
