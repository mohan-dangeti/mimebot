import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Data>? data,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "title") @Default('') String? title,
    @JsonKey(name: "description") @Default('') String? description,
    @JsonKey(name: "created_dt") @Default('') String? createdDt,
    @JsonKey(name: "updated_dt") @Default('')  String? updatedDt,
    @JsonKey(name: "status") @Default(0) int? status,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
