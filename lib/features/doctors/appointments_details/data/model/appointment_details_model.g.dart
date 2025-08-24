// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetailsModel _$AppointmentDetailsModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailsModel(
      data: json['data'] == null
          ? null
          : AppointmentDataContainer.fromJson(
              json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      error: json['error'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AppointmentDetailsModelToJson(
        AppointmentDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
    };

AppointmentDataContainer _$AppointmentDataContainerFromJson(
        Map<String, dynamic> json) =>
    AppointmentDataContainer(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : LinksModel.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentDataContainerToJson(
        AppointmentDataContainer instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

AppointmentData _$AppointmentDataFromJson(Map<String, dynamic> json) =>
    AppointmentData(
      id: (json['id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      file: json['file'],
      doctorEvaluation: json['doctorEvaluation'],
      doctorEvaluationAt: json['doctorEvaluationAt'],
      userMessage: json['userMessage'],
      rating: json['rating'],
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AppointmentDataToJson(AppointmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'file': instance.file,
      'doctorEvaluation': instance.doctorEvaluation,
      'doctorEvaluationAt': instance.doctorEvaluationAt,
      'userMessage': instance.userMessage,
      'rating': instance.rating,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      specialization: json['specialization'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'gender': instance.gender,
      'image': instance.image,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'rate': instance.rate,
      'rateCount': instance.rateCount,
    };

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => PageLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
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
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$PageLinkToJson(PageLink instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
