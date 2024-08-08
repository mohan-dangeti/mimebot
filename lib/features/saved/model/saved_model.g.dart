// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedModelImpl _$$SavedModelImplFromJson(Map<String, dynamic> json) =>
    _$SavedModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['array'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SavedModelImplToJson(_$SavedModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'array': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      saveId: (json['save_id'] as num?)?.toInt() ?? 0,
      regId: (json['reg_id'] as num?)?.toInt() ?? 0,
      vidId: (json['vid_id'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      lesTitle: json['les_title'] as String? ?? '',
      vidTitle: json['vid_title'] as String? ?? '',
      vidImg: json['vid_img'] as String? ?? '',
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'save_id': instance.saveId,
      'reg_id': instance.regId,
      'vid_id': instance.vidId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_name': instance.userName,
      'les_title': instance.lesTitle,
      'vid_title': instance.vidTitle,
      'vid_img': instance.vidImg,
    };
