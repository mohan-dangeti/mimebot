import 'package:freezed_annotation/freezed_annotation.dart';
part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
class RegistrationModel with _$RegistrationModel {
  const factory RegistrationModel({
    @JsonKey(name: "status")  @Default(true)  bool? status,
    @JsonKey(name: "message")  @Default('')  String? message,
    @JsonKey(name: "data")  @Default(Data())  Data? data,
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "reg_id") @Default('')  String? regId,
    @JsonKey(name: "user_name") @Default('')  String? userName,
    @JsonKey(name: "phone") @Default('')  String? phone,
    @JsonKey(name: "email") @Default('')  String? email,
    @JsonKey(name: "password") @Default('')  String? password,
    @JsonKey(name: "otp") @Default('')  String? otp,
    @JsonKey(name: "cus_profile_pic") @Default(CusProfilePic())  CusProfilePic? cusProfilePic,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class CusProfilePic with _$CusProfilePic {
  const factory CusProfilePic({
    @JsonKey(name: "name")  @Default('')  String? name,
    @JsonKey(name: "full_path")  @Default('')  String? fullPath,
    @JsonKey(name: "type")  @Default('')  String? type,
    @JsonKey(name: "tmp_name")  @Default('')  String? tmpName,
    @JsonKey(name: "error")  @Default(0)  int? error,
    @JsonKey(name: "size")  @Default(0)  int? size,
  }) = _CusProfilePic;

  factory CusProfilePic.fromJson(Map<String, dynamic> json) =>
      _$CusProfilePicFromJson(json);
}
