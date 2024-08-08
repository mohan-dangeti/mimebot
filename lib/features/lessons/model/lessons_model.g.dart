// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonModelImpl _$$LessonModelImplFromJson(Map<String, dynamic> json) =>
    _$LessonModelImpl(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LessonModelImplToJson(_$LessonModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      corTitle: json['cor_title'] as String? ?? '',
      categoryName: json['category_name'] as String? ?? '',
      lesId: (json['les_id'] as num?)?.toInt() ?? 0,
      corId: (json['cor_id'] as num?)?.toInt() ?? 0,
      autId: (json['aut_id'] as num?)?.toInt() ?? 0,
      lesImg: json['les_img'] as String? ?? '',
      lesTitle: json['les_title'] as String? ?? '',
      lesDesc: json['les_desc'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      createdBy: json['created_by'] as String? ?? '',
      updatedBy: json['updated_by'] as String? ?? '',
      vidImg: json['vid_img'] as String? ?? '',
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'cor_title': instance.corTitle,
      'category_name': instance.categoryName,
      'les_id': instance.lesId,
      'cor_id': instance.corId,
      'aut_id': instance.autId,
      'les_img': instance.lesImg,
      'les_title': instance.lesTitle,
      'les_desc': instance.lesDesc,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'vid_img': instance.vidImg,
    };
