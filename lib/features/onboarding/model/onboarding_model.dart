import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';
part 'onboarding_model.g.dart';

@freezed
class OnBoardingModel with _$OnBoardingModel {
  const factory OnBoardingModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Data>? data,
  }) = _OnBoardingModel;

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "title") @Default('') String? title,
    @JsonKey(name: "description") @Default('') String? description,
    @JsonKey(name: "image") @Default('') String? image,
    @JsonKey(name: "status") @Default(0) int? status,
    @JsonKey(name: "created_dt") @Default('') String? createdDt,
    @JsonKey(name: "updated_dt") @Default('') String? updatedDt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
