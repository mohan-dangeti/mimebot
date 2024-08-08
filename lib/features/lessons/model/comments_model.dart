import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class CommentsModel with _$CommentsModel {
  const factory CommentsModel({
    @JsonKey(name: "status") @Default('') String? status,
    @JsonKey(name: "message") @Default('') String? message,
    @JsonKey(name: "Data") @Default([]) List<Comment>? data,
  }) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    @JsonKey(name: "com_id") @Default(0) int? comId,
    @JsonKey(name: "les_id") @Default(0) int? lesId,
    @JsonKey(name: "user_id") @Default(0) int? userId,
    @JsonKey(name: "comment") @Default('') String? comment,
    @JsonKey(name: "status") @Default(0) int? status,
    @JsonKey(name: "created_at") @Default('') String? createdAt,
    @JsonKey(name: "updated_at") @Default('') String? updatedAt,
    @JsonKey(name: "user_name") @Default('') String? userName,
    @JsonKey(name: "les_title") @Default('') String? lesTitle,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
