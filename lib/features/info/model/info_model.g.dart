// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfoModelImpl _$$InfoModelImplFromJson(Map<String, dynamic> json) =>
    _$InfoModelImpl(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InfoModelImplToJson(_$InfoModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      contactUsImg: json['contact_us_img'] as String? ?? '',
      aboutUs: json['about_us'] as String? ?? '',
      aboutImg: json['about_img'] as String? ?? '',
      term: json['term'] as String? ?? '',
      termImg: json['term_img'] as String? ?? '',
      privacyPolicy: json['privacy_policy'] as String? ?? '',
      privacyImg: json['privacy_img'] as String? ?? '',
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'contact_us_img': instance.contactUsImg,
      'about_us': instance.aboutUs,
      'about_img': instance.aboutImg,
      'term': instance.term,
      'term_img': instance.termImg,
      'privacy_policy': instance.privacyPolicy,
      'privacy_img': instance.privacyImg,
    };
