import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: "status") @Default(false)  bool? status,
    @JsonKey(name: "message") @Default('')  String? message,
    @JsonKey(name: "data") @Default(Data())  Data? data,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "reg_id") @Default(0)  int? regId,
    @JsonKey(name: "user_name") @Default('')  String? userName,
    @JsonKey(name: "mobile_number") @Default('')  String? mobileNumber,
    @JsonKey(name: "email") @Default('') String? email,
    @JsonKey(name: "password") @Default('')  String? password,
    @JsonKey(name: "user_img") @Default('')  String? userImg,
    @JsonKey(name: "device_id") @Default('')  String? deviceId,
    @JsonKey(name: "status") @Default(0)  int? status,
    @JsonKey(name: "created_at") @Default('')  String? createdAt,
    @JsonKey(name: "updated_at") @Default('')  String? updatedAt,
    @JsonKey(name: "otp_number") @Default(0) int? otpNumber,
    @JsonKey(name: "email_otp") @Default('')  String? emailOtp,
    @JsonKey(name: "a_status") @Default(0)  int? aStatus,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
