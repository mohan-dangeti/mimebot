// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) {
  return _LessonModel.fromJson(json);
}

/// @nodoc
mixin _$LessonModel {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  List<Data>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonModelCopyWith<LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonModelCopyWith<$Res> {
  factory $LessonModelCopyWith(
          LessonModel value, $Res Function(LessonModel) then) =
      _$LessonModelCopyWithImpl<$Res, LessonModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "Data") List<Data>? data});
}

/// @nodoc
class _$LessonModelCopyWithImpl<$Res, $Val extends LessonModel>
    implements $LessonModelCopyWith<$Res> {
  _$LessonModelCopyWithImpl(this._value, this._then);

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
              as String?,
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
abstract class _$$LessonModelImplCopyWith<$Res>
    implements $LessonModelCopyWith<$Res> {
  factory _$$LessonModelImplCopyWith(
          _$LessonModelImpl value, $Res Function(_$LessonModelImpl) then) =
      __$$LessonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "Data") List<Data>? data});
}

/// @nodoc
class __$$LessonModelImplCopyWithImpl<$Res>
    extends _$LessonModelCopyWithImpl<$Res, _$LessonModelImpl>
    implements _$$LessonModelImplCopyWith<$Res> {
  __$$LessonModelImplCopyWithImpl(
      _$LessonModelImpl _value, $Res Function(_$LessonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LessonModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$LessonModelImpl implements _LessonModel {
  const _$LessonModelImpl(
      {@JsonKey(name: "status") this.status = '',
      @JsonKey(name: "message") this.message = '',
      @JsonKey(name: "Data") final List<Data>? data = const []})
      : _data = data;

  factory _$LessonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<Data>? _data;
  @override
  @JsonKey(name: "Data")
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonModelImpl &&
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
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      __$$LessonModelImplCopyWithImpl<_$LessonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonModelImplToJson(
      this,
    );
  }
}

abstract class _LessonModel implements LessonModel {
  const factory _LessonModel(
      {@JsonKey(name: "status") final String? status,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "Data") final List<Data>? data}) = _$LessonModelImpl;

  factory _LessonModel.fromJson(Map<String, dynamic> json) =
      _$LessonModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "Data")
  List<Data>? get data;
  @override
  @JsonKey(ignore: true)
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "cor_title")
  String? get corTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "les_id")
  int? get lesId => throw _privateConstructorUsedError;
  @JsonKey(name: "cor_id")
  int? get corId => throw _privateConstructorUsedError;
  @JsonKey(name: "aut_id")
  int? get autId => throw _privateConstructorUsedError;
  @JsonKey(name: "les_img")
  String? get lesImg => throw _privateConstructorUsedError;
  @JsonKey(name: "les_title")
  String? get lesTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "les_desc")
  String? get lesDesc => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_by")
  String? get updatedBy => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "cor_title") String? corTitle,
      @JsonKey(name: "category_name") String? categoryName,
      @JsonKey(name: "les_id") int? lesId,
      @JsonKey(name: "cor_id") int? corId,
      @JsonKey(name: "aut_id") int? autId,
      @JsonKey(name: "les_img") String? lesImg,
      @JsonKey(name: "les_title") String? lesTitle,
      @JsonKey(name: "les_desc") String? lesDesc,
      @JsonKey(name: "status") int? status,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
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
    Object? corTitle = freezed,
    Object? categoryName = freezed,
    Object? lesId = freezed,
    Object? corId = freezed,
    Object? autId = freezed,
    Object? lesImg = freezed,
    Object? lesTitle = freezed,
    Object? lesDesc = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? vidImg = freezed,
  }) {
    return _then(_value.copyWith(
      corTitle: freezed == corTitle
          ? _value.corTitle
          : corTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      lesId: freezed == lesId
          ? _value.lesId
          : lesId // ignore: cast_nullable_to_non_nullable
              as int?,
      corId: freezed == corId
          ? _value.corId
          : corId // ignore: cast_nullable_to_non_nullable
              as int?,
      autId: freezed == autId
          ? _value.autId
          : autId // ignore: cast_nullable_to_non_nullable
              as int?,
      lesImg: freezed == lesImg
          ? _value.lesImg
          : lesImg // ignore: cast_nullable_to_non_nullable
              as String?,
      lesTitle: freezed == lesTitle
          ? _value.lesTitle
          : lesTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      lesDesc: freezed == lesDesc
          ? _value.lesDesc
          : lesDesc // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "cor_title") String? corTitle,
      @JsonKey(name: "category_name") String? categoryName,
      @JsonKey(name: "les_id") int? lesId,
      @JsonKey(name: "cor_id") int? corId,
      @JsonKey(name: "aut_id") int? autId,
      @JsonKey(name: "les_img") String? lesImg,
      @JsonKey(name: "les_title") String? lesTitle,
      @JsonKey(name: "les_desc") String? lesDesc,
      @JsonKey(name: "status") int? status,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
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
    Object? corTitle = freezed,
    Object? categoryName = freezed,
    Object? lesId = freezed,
    Object? corId = freezed,
    Object? autId = freezed,
    Object? lesImg = freezed,
    Object? lesTitle = freezed,
    Object? lesDesc = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? vidImg = freezed,
  }) {
    return _then(_$DataImpl(
      corTitle: freezed == corTitle
          ? _value.corTitle
          : corTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      lesId: freezed == lesId
          ? _value.lesId
          : lesId // ignore: cast_nullable_to_non_nullable
              as int?,
      corId: freezed == corId
          ? _value.corId
          : corId // ignore: cast_nullable_to_non_nullable
              as int?,
      autId: freezed == autId
          ? _value.autId
          : autId // ignore: cast_nullable_to_non_nullable
              as int?,
      lesImg: freezed == lesImg
          ? _value.lesImg
          : lesImg // ignore: cast_nullable_to_non_nullable
              as String?,
      lesTitle: freezed == lesTitle
          ? _value.lesTitle
          : lesTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      lesDesc: freezed == lesDesc
          ? _value.lesDesc
          : lesDesc // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "cor_title") this.corTitle = '',
      @JsonKey(name: "category_name") this.categoryName = '',
      @JsonKey(name: "les_id") this.lesId = 0,
      @JsonKey(name: "cor_id") this.corId = 0,
      @JsonKey(name: "aut_id") this.autId = 0,
      @JsonKey(name: "les_img") this.lesImg = '',
      @JsonKey(name: "les_title") this.lesTitle = '',
      @JsonKey(name: "les_desc") this.lesDesc = '',
      @JsonKey(name: "status") this.status = 0,
      @JsonKey(name: "created_at") this.createdAt = '',
      @JsonKey(name: "updated_at") this.updatedAt = '',
      @JsonKey(name: "created_by") this.createdBy = '',
      @JsonKey(name: "updated_by") this.updatedBy = '',
      @JsonKey(name: "vid_img") this.vidImg = ''});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "cor_title")
  final String? corTitle;
  @override
  @JsonKey(name: "category_name")
  final String? categoryName;
  @override
  @JsonKey(name: "les_id")
  final int? lesId;
  @override
  @JsonKey(name: "cor_id")
  final int? corId;
  @override
  @JsonKey(name: "aut_id")
  final int? autId;
  @override
  @JsonKey(name: "les_img")
  final String? lesImg;
  @override
  @JsonKey(name: "les_title")
  final String? lesTitle;
  @override
  @JsonKey(name: "les_desc")
  final String? lesDesc;
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
  @JsonKey(name: "created_by")
  final String? createdBy;
  @override
  @JsonKey(name: "updated_by")
  final String? updatedBy;
  @override
  @JsonKey(name: "vid_img")
  final String? vidImg;

  @override
  String toString() {
    return 'Data(corTitle: $corTitle, categoryName: $categoryName, lesId: $lesId, corId: $corId, autId: $autId, lesImg: $lesImg, lesTitle: $lesTitle, lesDesc: $lesDesc, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, vidImg: $vidImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.corTitle, corTitle) ||
                other.corTitle == corTitle) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.lesId, lesId) || other.lesId == lesId) &&
            (identical(other.corId, corId) || other.corId == corId) &&
            (identical(other.autId, autId) || other.autId == autId) &&
            (identical(other.lesImg, lesImg) || other.lesImg == lesImg) &&
            (identical(other.lesTitle, lesTitle) ||
                other.lesTitle == lesTitle) &&
            (identical(other.lesDesc, lesDesc) || other.lesDesc == lesDesc) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.vidImg, vidImg) || other.vidImg == vidImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      corTitle,
      categoryName,
      lesId,
      corId,
      autId,
      lesImg,
      lesTitle,
      lesDesc,
      status,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      vidImg);

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
      {@JsonKey(name: "cor_title") final String? corTitle,
      @JsonKey(name: "category_name") final String? categoryName,
      @JsonKey(name: "les_id") final int? lesId,
      @JsonKey(name: "cor_id") final int? corId,
      @JsonKey(name: "aut_id") final int? autId,
      @JsonKey(name: "les_img") final String? lesImg,
      @JsonKey(name: "les_title") final String? lesTitle,
      @JsonKey(name: "les_desc") final String? lesDesc,
      @JsonKey(name: "status") final int? status,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "created_by") final String? createdBy,
      @JsonKey(name: "updated_by") final String? updatedBy,
      @JsonKey(name: "vid_img") final String? vidImg}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "cor_title")
  String? get corTitle;
  @override
  @JsonKey(name: "category_name")
  String? get categoryName;
  @override
  @JsonKey(name: "les_id")
  int? get lesId;
  @override
  @JsonKey(name: "cor_id")
  int? get corId;
  @override
  @JsonKey(name: "aut_id")
  int? get autId;
  @override
  @JsonKey(name: "les_img")
  String? get lesImg;
  @override
  @JsonKey(name: "les_title")
  String? get lesTitle;
  @override
  @JsonKey(name: "les_desc")
  String? get lesDesc;
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
  @JsonKey(name: "created_by")
  String? get createdBy;
  @override
  @JsonKey(name: "updated_by")
  String? get updatedBy;
  @override
  @JsonKey(name: "vid_img")
  String? get vidImg;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
