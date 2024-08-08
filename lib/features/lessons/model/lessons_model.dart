import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_model.freezed.dart';
part 'lessons_model.g.dart';

@freezed
class LessonModel with _$LessonModel {
  const factory LessonModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Data>? data,
  }) = _LessonModel;

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "cor_title") @Default('') String? corTitle,
    @JsonKey(name: "category_name") @Default('') String? categoryName,
    @JsonKey(name: "les_id")  @Default(0)  int? lesId,
    @JsonKey(name: "cor_id")  @Default(0)  int? corId,
    @JsonKey(name: "aut_id")  @Default(0)  int? autId,
    @JsonKey(name: "les_img") @Default('') String? lesImg,
    @JsonKey(name: "les_title") @Default('') String? lesTitle,
    @JsonKey(name: "les_desc") @Default('') String? lesDesc,
    @JsonKey(name: "status") @Default(0) int? status,
    @JsonKey(name: "created_at") @Default('') String? createdAt,
    @JsonKey(name: "updated_at") @Default('') String? updatedAt,
    @JsonKey(name: "created_by") @Default('') String? createdBy,
    @JsonKey(name: "updated_by") @Default('') String? updatedBy,
    @JsonKey(name: "vid_img")  @Default('')
    String? vidImg,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
