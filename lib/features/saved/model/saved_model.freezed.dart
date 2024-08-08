// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedModel _$SavedModelFromJson(Map<String, dynamic> json) {
  return _SavedModel.fromJson(json);
}

/// @nodoc
mixin _$SavedModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "array")
  List<Data>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedModelCopyWith<SavedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedModelCopyWith<$Res> {
  factory $SavedModelCopyWith(
          SavedModel value, $Res Function(SavedModel) then) =
      _$SavedModelCopyWithImpl<$Res, SavedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "array") List<Data>? data});
}

/// @nodoc
class _$SavedModelCopyWithImpl<$Res, $Val extends SavedModel>
    implements $SavedModelCopyWith<$Res> {
  _$SavedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedModelImplCopyWith<$Res>
    implements $SavedModelCopyWith<$Res> {
  factory _$$SavedModelImplCopyWith(
          _$SavedModelImpl value, $Res Function(_$SavedModelImpl) then) =
      __$$SavedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "array") List<Data>? data});
}

/// @nodoc
class __$$SavedModelImplCopyWithImpl<$Res>
    extends _$SavedModelCopyWithImpl<$Res, _$SavedModelImpl>
    implements _$$SavedModelImplCopyWith<$Res> {
  __$$SavedModelImplCopyWithImpl(
      _$SavedModelImpl _value, $Res Function(_$SavedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SavedModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedModelImpl implements _SavedModel {
  const _$SavedModelImpl(
      {@JsonKey(name: "status") this.status = false,
      @JsonKey(name: "message") this.message = '',
      @JsonKey(name: "array") final List<Data>? data = const []})
      : _data = data;

  factory _$SavedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<Data>? _data;
  @override
  @JsonKey(name: "array")
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SavedModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedModelImplCopyWith<_$SavedModelImpl> get copyWith =>
      __$$SavedModelImplCopyWithImpl<_$SavedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedModelImplToJson(
      this,
    );
  }
}

abstract class _SavedModel implements SavedModel {
  const factory _SavedModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "array") final List<Data>? data}) = _$SavedModelImpl;

  factory _SavedModel.fromJson(Map<String, dynamic> json) =
      _$SavedModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "array")
  List<Data>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SavedModelImplCopyWith<_$SavedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "save_id")
  int? get saveId => throw _privateConstructorUsedError;
  @JsonKey(name: "reg_id")
  int? get regId => throw _privateConstructorUsedError;
  @JsonKey(name: "vid_id")
  int? get vidId => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "user_name")
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: "les_title")
  String? get lesTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "vid_title")
  String? get vidTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "vid_img")
  String? get vidImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "save_id") int? saveId,
      @JsonKey(name: "reg_id") int? regId,
      @JsonKey(name: "vid_id") int? vidId,
      @JsonKey(name: "status") int? status,
      
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "user_name") String? userName,
      @JsonKey(name: "les_title") String? lesTitle,
      @JsonKey(name: "vid_title") String? vidTitle,
      @JsonKey(name: "vid_img") String? vidImg});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveId = freezed,
    Object? regId = freezed,
    Object? vidId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userName = freezed,
    Object? lesTitle = freezed,
    Object? vidTitle = freezed,
    Object? vidImg = freezed,
  }) {
    return _then(_value.copyWith(
      saveId: freezed == saveId
          ? _value.saveId
          : saveId // ignore: cast_nullable_to_non_nullable
              as int?,
      regId: freezed == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int?,
      vidId: freezed == vidId
          ? _value.vidId
          : vidId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      lesTitle: freezed == lesTitle
          ? _value.lesTitle
          : lesTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      vidTitle: freezed == vidTitle
          ? _value.vidTitle
          : vidTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      vidImg: freezed == vidImg
          ? _value.vidImg
          : vidImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "save_id") int? saveId,
      @JsonKey(name: "reg_id") int? regId,
      @JsonKey(name: "vid_id") int? vidId,
      @JsonKey(name: "status") int? status,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "user_name") String? userName,
      @JsonKey(name: "les_title") String? lesTitle,
      @JsonKey(name: "vid_title") String? vidTitle,
      @JsonKey(name: "vid_img") String? vidImg});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveId = freezed,
    Object? regId = freezed,
    Object? vidId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userName = freezed,
    Object? lesTitle = freezed,
    Object? vidTitle = freezed,
    Object? vidImg = freezed,
  }) {
    return _then(_$DataImpl(
      saveId: freezed == saveId
          ? _value.saveId
          : saveId // ignore: cast_nullable_to_non_nullable
              as int?,
      regId: freezed == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int?,
      vidId: freezed == vidId
          ? _value.vidId
          : vidId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      lesTitle: freezed == lesTitle
          ? _value.lesTitle
          : lesTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      vidTitle: freezed == vidTitle
          ? _value.vidTitle
          : vidTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      vidImg: freezed == vidImg
          ? _value.vidImg
          : vidImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "save_id") this.saveId = 0,
      @JsonKey(name: "reg_id") this.regId = 0,
      @JsonKey(name: "vid_id") this.vidId = 0,
      @JsonKey(name: "status") this.status = 0,
      @JsonKey(name: "created_at") this.createdAt = '',
      @JsonKey(name: "updated_at") this.updatedAt = '',
      @JsonKey(name: "user_name") this.userName = '',
      @JsonKey(name: "les_title") this.lesTitle = '',
      @JsonKey(name: "vid_title") this.vidTitle = '',
      @JsonKey(name: "vid_img") this.vidImg = ''});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "save_id")
  final int? saveId;
  @override
  @JsonKey(name: "reg_id")
  final int? regId;
  @override
  @JsonKey(name: "vid_id")
  final int? vidId;
  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "user_name")
  final String? userName;
  @override
  @JsonKey(name: "les_title")
  final String? lesTitle;
  @override
  @JsonKey(name: "vid_title")
  final String? vidTitle;
  @override
  @JsonKey(name: "vid_img")
  final String? vidImg;

  @override
  String toString() {
    return 'Data(saveId: $saveId, regId: $regId, vidId: $vidId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, userName: $userName, lesTitle: $lesTitle, vidTitle: $vidTitle, vidImg: $vidImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.saveId, saveId) || other.saveId == saveId) &&
            (identical(other.regId, regId) || other.regId == regId) &&
            (identical(other.vidId, vidId) || other.vidId == vidId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.lesTitle, lesTitle) ||
                other.lesTitle == lesTitle) &&
            (identical(other.vidTitle, vidTitle) ||
                other.vidTitle == vidTitle) &&
            (identical(other.vidImg, vidImg) || other.vidImg == vidImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, saveId, regId, vidId, status,
      createdAt, updatedAt, userName, lesTitle, vidTitle, vidImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: "save_id") final int? saveId,
      @JsonKey(name: "reg_id") final int? regId,
      @JsonKey(name: "vid_id") final int? vidId,
      @JsonKey(name: "status") final int? status,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "user_name") final String? userName,
      @JsonKey(name: "les_title") final String? lesTitle,
      @JsonKey(name: "vid_title") final String? vidTitle,
      @JsonKey(name: "vid_img") final String? vidImg}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "save_id")
  int? get saveId;
  @override
  @JsonKey(name: "reg_id")
  int? get regId;
  @override
  @JsonKey(name: "vid_id")
  int? get vidId;
  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "user_name")
  String? get userName;
  @override
  @JsonKey(name: "les_title")
  String? get lesTitle;
  @override
  @JsonKey(name: "vid_title")
  String? get vidTitle;
  @override
  @JsonKey(name: "vid_img")
  String? get vidImg;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
