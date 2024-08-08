// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) {
  return _RegistrationModel.fromJson(json);
}

/// @nodoc
mixin _$RegistrationModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationModelCopyWith<RegistrationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationModelCopyWith<$Res> {
  factory $RegistrationModelCopyWith(
          RegistrationModel value, $Res Function(RegistrationModel) then) =
      _$RegistrationModelCopyWithImpl<$Res, RegistrationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RegistrationModelCopyWithImpl<$Res, $Val extends RegistrationModel>
    implements $RegistrationModelCopyWith<$Res> {
  _$RegistrationModelCopyWithImpl(this._value, this._then);

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
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegistrationModelImplCopyWith<$Res>
    implements $RegistrationModelCopyWith<$Res> {
  factory _$$RegistrationModelImplCopyWith(_$RegistrationModelImpl value,
          $Res Function(_$RegistrationModelImpl) then) =
      __$$RegistrationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RegistrationModelImplCopyWithImpl<$Res>
    extends _$RegistrationModelCopyWithImpl<$Res, _$RegistrationModelImpl>
    implements _$$RegistrationModelImplCopyWith<$Res> {
  __$$RegistrationModelImplCopyWithImpl(_$RegistrationModelImpl _value,
      $Res Function(_$RegistrationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RegistrationModelImpl(
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
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationModelImpl implements _RegistrationModel {
  const _$RegistrationModelImpl(
      {@JsonKey(name: "status") this.status = true,
      @JsonKey(name: "message") this.message = '',
      @JsonKey(name: "data") this.data = const Data()});

  factory _$RegistrationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final Data? data;

  @override
  String toString() {
    return 'RegistrationModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationModelImplCopyWith<_$RegistrationModelImpl> get copyWith =>
      __$$RegistrationModelImplCopyWithImpl<_$RegistrationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationModelImplToJson(
      this,
    );
  }
}

abstract class _RegistrationModel implements RegistrationModel {
  const factory _RegistrationModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$RegistrationModelImpl;

  factory _RegistrationModel.fromJson(Map<String, dynamic> json) =
      _$RegistrationModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationModelImplCopyWith<_$RegistrationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "reg_id")
  String? get regId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_name")
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "cus_profile_pic")
  CusProfilePic? get cusProfilePic => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "reg_id") String? regId,
      @JsonKey(name: "user_name") String? userName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "cus_profile_pic") CusProfilePic? cusProfilePic});

  $CusProfilePicCopyWith<$Res>? get cusProfilePic;
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
    Object? regId = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? otp = freezed,
    Object? cusProfilePic = freezed,
  }) {
    return _then(_value.copyWith(
      regId: freezed == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      cusProfilePic: freezed == cusProfilePic
          ? _value.cusProfilePic
          : cusProfilePic // ignore: cast_nullable_to_non_nullable
              as CusProfilePic?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CusProfilePicCopyWith<$Res>? get cusProfilePic {
    if (_value.cusProfilePic == null) {
      return null;
    }

    return $CusProfilePicCopyWith<$Res>(_value.cusProfilePic!, (value) {
      return _then(_value.copyWith(cusProfilePic: value) as $Val);
    });
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
      {@JsonKey(name: "reg_id") String? regId,
      @JsonKey(name: "user_name") String? userName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "cus_profile_pic") CusProfilePic? cusProfilePic});

  @override
  $CusProfilePicCopyWith<$Res>? get cusProfilePic;
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
    Object? regId = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? otp = freezed,
    Object? cusProfilePic = freezed,
  }) {
    return _then(_$DataImpl(
      regId: freezed == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      cusProfilePic: freezed == cusProfilePic
          ? _value.cusProfilePic
          : cusProfilePic // ignore: cast_nullable_to_non_nullable
              as CusProfilePic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "reg_id") this.regId = '',
      @JsonKey(name: "user_name") this.userName = '',
      @JsonKey(name: "phone") this.phone = '',
      @JsonKey(name: "email") this.email = '',
      @JsonKey(name: "password") this.password = '',
      @JsonKey(name: "otp") this.otp = '',
      @JsonKey(name: "cus_profile_pic")
      this.cusProfilePic = const CusProfilePic()});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "reg_id")
  final String? regId;
  @override
  @JsonKey(name: "user_name")
  final String? userName;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;
  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "cus_profile_pic")
  final CusProfilePic? cusProfilePic;

  @override
  String toString() {
    return 'Data(regId: $regId, userName: $userName, phone: $phone, email: $email, password: $password, otp: $otp, cusProfilePic: $cusProfilePic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.regId, regId) || other.regId == regId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.cusProfilePic, cusProfilePic) ||
                other.cusProfilePic == cusProfilePic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, regId, userName, phone, email, password, otp, cusProfilePic);

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
      {@JsonKey(name: "reg_id") final String? regId,
      @JsonKey(name: "user_name") final String? userName,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "password") final String? password,
      @JsonKey(name: "otp") final String? otp,
      @JsonKey(name: "cus_profile_pic")
      final CusProfilePic? cusProfilePic}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "reg_id")
  String? get regId;
  @override
  @JsonKey(name: "user_name")
  String? get userName;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;
  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "cus_profile_pic")
  CusProfilePic? get cusProfilePic;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CusProfilePic _$CusProfilePicFromJson(Map<String, dynamic> json) {
  return _CusProfilePic.fromJson(json);
}

/// @nodoc
mixin _$CusProfilePic {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "full_path")
  String? get fullPath => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "tmp_name")
  String? get tmpName => throw _privateConstructorUsedError;
  @JsonKey(name: "error")
  int? get error => throw _privateConstructorUsedError;
  @JsonKey(name: "size")
  int? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CusProfilePicCopyWith<CusProfilePic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CusProfilePicCopyWith<$Res> {
  factory $CusProfilePicCopyWith(
          CusProfilePic value, $Res Function(CusProfilePic) then) =
      _$CusProfilePicCopyWithImpl<$Res, CusProfilePic>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "full_path") String? fullPath,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "tmp_name") String? tmpName,
      @JsonKey(name: "error") int? error,
      @JsonKey(name: "size") int? size});
}

/// @nodoc
class _$CusProfilePicCopyWithImpl<$Res, $Val extends CusProfilePic>
    implements $CusProfilePicCopyWith<$Res> {
  _$CusProfilePicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fullPath = freezed,
    Object? type = freezed,
    Object? tmpName = freezed,
    Object? error = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullPath: freezed == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tmpName: freezed == tmpName
          ? _value.tmpName
          : tmpName // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CusProfilePicImplCopyWith<$Res>
    implements $CusProfilePicCopyWith<$Res> {
  factory _$$CusProfilePicImplCopyWith(
          _$CusProfilePicImpl value, $Res Function(_$CusProfilePicImpl) then) =
      __$$CusProfilePicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "full_path") String? fullPath,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "tmp_name") String? tmpName,
      @JsonKey(name: "error") int? error,
      @JsonKey(name: "size") int? size});
}

/// @nodoc
class __$$CusProfilePicImplCopyWithImpl<$Res>
    extends _$CusProfilePicCopyWithImpl<$Res, _$CusProfilePicImpl>
    implements _$$CusProfilePicImplCopyWith<$Res> {
  __$$CusProfilePicImplCopyWithImpl(
      _$CusProfilePicImpl _value, $Res Function(_$CusProfilePicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fullPath = freezed,
    Object? type = freezed,
    Object? tmpName = freezed,
    Object? error = freezed,
    Object? size = freezed,
  }) {
    return _then(_$CusProfilePicImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullPath: freezed == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tmpName: freezed == tmpName
          ? _value.tmpName
          : tmpName // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CusProfilePicImpl implements _CusProfilePic {
  const _$CusProfilePicImpl(
      {@JsonKey(name: "name") this.name = '',
      @JsonKey(name: "full_path") this.fullPath = '',
      @JsonKey(name: "type") this.type = '',
      @JsonKey(name: "tmp_name") this.tmpName = '',
      @JsonKey(name: "error") this.error = 0,
      @JsonKey(name: "size") this.size = 0});

  factory _$CusProfilePicImpl.fromJson(Map<String, dynamic> json) =>
      _$$CusProfilePicImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "full_path")
  final String? fullPath;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "tmp_name")
  final String? tmpName;
  @override
  @JsonKey(name: "error")
  final int? error;
  @override
  @JsonKey(name: "size")
  final int? size;

  @override
  String toString() {
    return 'CusProfilePic(name: $name, fullPath: $fullPath, type: $type, tmpName: $tmpName, error: $error, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CusProfilePicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullPath, fullPath) ||
                other.fullPath == fullPath) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tmpName, tmpName) || other.tmpName == tmpName) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, fullPath, type, tmpName, error, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CusProfilePicImplCopyWith<_$CusProfilePicImpl> get copyWith =>
      __$$CusProfilePicImplCopyWithImpl<_$CusProfilePicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CusProfilePicImplToJson(
      this,
    );
  }
}

abstract class _CusProfilePic implements CusProfilePic {
  const factory _CusProfilePic(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "full_path") final String? fullPath,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "tmp_name") final String? tmpName,
      @JsonKey(name: "error") final int? error,
      @JsonKey(name: "size") final int? size}) = _$CusProfilePicImpl;

  factory _CusProfilePic.fromJson(Map<String, dynamic> json) =
      _$CusProfilePicImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "full_path")
  String? get fullPath;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "tmp_name")
  String? get tmpName;
  @override
  @JsonKey(name: "error")
  int? get error;
  @override
  @JsonKey(name: "size")
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$CusProfilePicImplCopyWith<_$CusProfilePicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
