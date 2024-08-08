import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @JsonKey(name: "status") @Default(false)  bool? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "data") @Default(Data())  Data? data,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "reg_id") @Default(0)  int? regId,
    @JsonKey(name: "user_name") @Default('') String? userName,
    @JsonKey(name: "user_img") @Default('')  String? userImg,
    @JsonKey(name: "email") @Default('')  String? email,
    @JsonKey(name: "mobile_number") @Default('') String? mobileNumber,
    @JsonKey(name: "otp_number") @Default(0) int? otpNumber,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
