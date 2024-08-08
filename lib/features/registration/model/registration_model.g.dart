// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationModelImpl _$$RegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationModelImpl(
      status: json['status'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegistrationModelImplToJson(
        _$RegistrationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      regId: json['reg_id'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      otp: json['otp'] as String? ?? '',
      cusProfilePic: json['cus_profile_pic'] == null
          ? const CusProfilePic()
          : CusProfilePic.fromJson(
              json['cus_profile_pic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'reg_id': instance.regId,
      'user_name': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'otp': instance.otp,
      'cus_profile_pic': instance.cusProfilePic,
    };

_$CusProfilePicImpl _$$CusProfilePicImplFromJson(Map<String, dynamic> json) =>
    _$CusProfilePicImpl(
      name: json['name'] as String? ?? '',
      fullPath: json['full_path'] as String? ?? '',
      type: json['type'] as String? ?? '',
      tmpName: json['tmp_name'] as String? ?? '',
      error: (json['error'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CusProfilePicImplToJson(_$CusProfilePicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_path': instance.fullPath,
      'type': instance.type,
      'tmp_name': instance.tmpName,
      'error': instance.error,
      'size': instance.size,
    };
