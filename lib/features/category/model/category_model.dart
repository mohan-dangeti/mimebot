import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Data>? data,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "category_id") @Default(0) int? categoryId,
    @JsonKey(name: "category_name") @Default('') String? categoryName,
    @JsonKey(name: "category_image") @Default('') String? categoryImage,
    @JsonKey(name: "category_status") @Default(0) int? categoryStatus,
    @JsonKey(name: "is_deleted") @Default(0) int? isDeleted,
    @JsonKey(name: "created_dt") @Default('') String? createdDt,
    @JsonKey(name: "updated_dt") @Default('') String updatedDt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
