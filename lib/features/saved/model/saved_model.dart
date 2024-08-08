import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_model.freezed.dart';
part 'saved_model.g.dart';

@freezed
class SavedModel with _$SavedModel {
  const factory SavedModel({
    @JsonKey(name: "status") @Default(false) bool? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "array") @Default([]) List<Data>? data,
  }) = _SavedModel;

  factory SavedModel.fromJson(Map<String, dynamic> json) =>
      _$SavedModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "save_id") @Default(0) int? saveId,
    @JsonKey(name: "reg_id") @Default(0) int? regId,
    @JsonKey(name: "vid_id") @Default(0) int? vidId,
    @JsonKey(name: "status") @Default(0) int? status,
    @JsonKey(name: "created_at") @Default('') String? createdAt,
    @JsonKey(name: "updated_at") @Default('') String? updatedAt,
    @JsonKey(name: "user_name")  @Default('') String? userName,
    @JsonKey(name: "les_title") @Default('') String? lesTitle,
    @JsonKey(name: "vid_title") @Default('') String? vidTitle,
    @JsonKey(name: "vid_img") @Default('') String? vidImg,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
