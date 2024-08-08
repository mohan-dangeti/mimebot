import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  const factory InfoModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([])  List<Data>? data,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "phone") @Default('') String? phone,
    @JsonKey(name: "email") @Default('') String? email,
    @JsonKey(name: "address") @Default('') String? address,
    @JsonKey(name: "contact_us_img") @Default('') String? contactUsImg,
    @JsonKey(name: "about_us") @Default('') String? aboutUs,
    @JsonKey(name: "about_img") @Default('') String? aboutImg,
    @JsonKey(name: "term") @Default('') String? term,
    @JsonKey(name: "term_img") @Default('') String? termImg,
    @JsonKey(name: "privacy_policy") @Default('') String? privacyPolicy,
    @JsonKey(name: "privacy_img") @Default('') String? privacyImg,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
