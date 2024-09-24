// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterOtp _$RegisterOtpFromJson(Map<String, dynamic> json) {
  return _RegisterOtp.fromJson(json);
}

/// @nodoc
mixin _$RegisterOtp {
  String? get number => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Serializes this RegisterOtp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterOtp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterOtpCopyWith<RegisterOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterOtpCopyWith<$Res> {
  factory $RegisterOtpCopyWith(
          RegisterOtp value, $Res Function(RegisterOtp) then) =
      _$RegisterOtpCopyWithImpl<$Res, RegisterOtp>;
  @useResult
  $Res call(
      {String? number,
      String? role,
      String? updatedAt,
      String? createdAt,
      int id});
}

/// @nodoc
class _$RegisterOtpCopyWithImpl<$Res, $Val extends RegisterOtp>
    implements $RegisterOtpCopyWith<$Res> {
  _$RegisterOtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterOtp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? role = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterOtpImplCopyWith<$Res>
    implements $RegisterOtpCopyWith<$Res> {
  factory _$$RegisterOtpImplCopyWith(
          _$RegisterOtpImpl value, $Res Function(_$RegisterOtpImpl) then) =
      __$$RegisterOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? number,
      String? role,
      String? updatedAt,
      String? createdAt,
      int id});
}

/// @nodoc
class __$$RegisterOtpImplCopyWithImpl<$Res>
    extends _$RegisterOtpCopyWithImpl<$Res, _$RegisterOtpImpl>
    implements _$$RegisterOtpImplCopyWith<$Res> {
  __$$RegisterOtpImplCopyWithImpl(
      _$RegisterOtpImpl _value, $Res Function(_$RegisterOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterOtp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? role = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? id = null,
  }) {
    return _then(_$RegisterOtpImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterOtpImpl implements _RegisterOtp {
  const _$RegisterOtpImpl(
      {this.number,
      this.role,
      this.updatedAt,
      this.createdAt,
      required this.id});

  factory _$RegisterOtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterOtpImplFromJson(json);

  @override
  final String? number;
  @override
  final String? role;
  @override
  final String? updatedAt;
  @override
  final String? createdAt;
  @override
  final int id;

  @override
  String toString() {
    return 'RegisterOtp(number: $number, role: $role, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterOtpImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, number, role, updatedAt, createdAt, id);

  /// Create a copy of RegisterOtp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterOtpImplCopyWith<_$RegisterOtpImpl> get copyWith =>
      __$$RegisterOtpImplCopyWithImpl<_$RegisterOtpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterOtpImplToJson(
      this,
    );
  }
}

abstract class _RegisterOtp implements RegisterOtp {
  const factory _RegisterOtp(
      {final String? number,
      final String? role,
      final String? updatedAt,
      final String? createdAt,
      required final int id}) = _$RegisterOtpImpl;

  factory _RegisterOtp.fromJson(Map<String, dynamic> json) =
      _$RegisterOtpImpl.fromJson;

  @override
  String? get number;
  @override
  String? get role;
  @override
  String? get updatedAt;
  @override
  String? get createdAt;
  @override
  int get id;

  /// Create a copy of RegisterOtp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterOtpImplCopyWith<_$RegisterOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
