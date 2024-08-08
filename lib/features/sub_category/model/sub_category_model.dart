import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Data>? data,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "cor_id")  @Default(0)  int? corId,
    @JsonKey(name: "category_id")  @Default(0) int? categoryId,
    @JsonKey(name: "cor_title") @Default('') String? corTitle,
    @JsonKey(name: "cor_img") @Default('') String? corImg,
    @JsonKey(name: "cor_desc") @Default('') String? corDesc,
    @JsonKey(name: "status")  @Default(0)  int? status,
    @JsonKey(name: "created_at") @Default('') String? createdAt,
    @JsonKey(name: "updated_at") @Default('') String? updatedAt,
    @JsonKey(name: "category_name") String? categoryName,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
