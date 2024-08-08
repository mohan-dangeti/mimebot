// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      regId: (json['reg_id'] as num?)?.toInt() ?? 0,
      userName: json['user_name'] as String? ?? '',
      mobileNumber: json['mobile_number'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      userImg: json['user_img'] as String? ?? '',
      deviceId: json['device_id'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      otpNumber: (json['otp_number'] as num?)?.toInt() ?? 0,
      emailOtp: json['email_otp'] as String? ?? '',
      aStatus: (json['a_status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'reg_id': instance.regId,
      'user_name': instance.userName,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'password': instance.password,
      'user_img': instance.userImg,
      'device_id': instance.deviceId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'otp_number': instance.otpNumber,
      'email_otp': instance.emailOtp,
      'a_status': instance.aStatus,
    };
