// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'glucose_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlucoseLevel _$GlucoseLevelFromJson(Map<String, dynamic> json) {
  return _GlucoseLevel.fromJson(json);
}

/// @nodoc
mixin _$GlucoseLevel {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum')
  String? get minimum => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum')
  String? get maximum => throw _privateConstructorUsedError;

  /// Serializes this GlucoseLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlucoseLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlucoseLevelCopyWith<GlucoseLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlucoseLevelCopyWith<$Res> {
  factory $GlucoseLevelCopyWith(
          GlucoseLevel value, $Res Function(GlucoseLevel) then) =
      _$GlucoseLevelCopyWithImpl<$Res, GlucoseLevel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'minimum') String? minimum,
      @JsonKey(name: 'maximum') String? maximum});
}

/// @nodoc
class _$GlucoseLevelCopyWithImpl<$Res, $Val extends GlucoseLevel>
    implements $GlucoseLevelCopyWith<$Res> {
  _$GlucoseLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlucoseLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as String?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlucoseLevelImplCopyWith<$Res>
    implements $GlucoseLevelCopyWith<$Res> {
  factory _$$GlucoseLevelImplCopyWith(
          _$GlucoseLevelImpl value, $Res Function(_$GlucoseLevelImpl) then) =
      __$$GlucoseLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'minimum') String? minimum,
      @JsonKey(name: 'maximum') String? maximum});
}

/// @nodoc
class __$$GlucoseLevelImplCopyWithImpl<$Res>
    extends _$GlucoseLevelCopyWithImpl<$Res, _$GlucoseLevelImpl>
    implements _$$GlucoseLevelImplCopyWith<$Res> {
  __$$GlucoseLevelImplCopyWithImpl(
      _$GlucoseLevelImpl _value, $Res Function(_$GlucoseLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlucoseLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_$GlucoseLevelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as String?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlucoseLevelImpl implements _GlucoseLevel {
  const _$GlucoseLevelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'minimum') this.minimum,
      @JsonKey(name: 'maximum') this.maximum});

  factory _$GlucoseLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlucoseLevelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'minimum')
  final String? minimum;
  @override
  @JsonKey(name: 'maximum')
  final String? maximum;

  @override
  String toString() {
    return 'GlucoseLevel(status: $status, message: $message, minimum: $minimum, maximum: $maximum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlucoseLevelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, minimum, maximum);

  /// Create a copy of GlucoseLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlucoseLevelImplCopyWith<_$GlucoseLevelImpl> get copyWith =>
      __$$GlucoseLevelImplCopyWithImpl<_$GlucoseLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlucoseLevelImplToJson(
      this,
    );
  }
}

abstract class _GlucoseLevel implements GlucoseLevel {
  const factory _GlucoseLevel(
      {@JsonKey(name: 'status') final int? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'minimum') final String? minimum,
      @JsonKey(name: 'maximum') final String? maximum}) = _$GlucoseLevelImpl;

  factory _GlucoseLevel.fromJson(Map<String, dynamic> json) =
      _$GlucoseLevelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'minimum')
  String? get minimum;
  @override
  @JsonKey(name: 'maximum')
  String? get maximum;

  /// Create a copy of GlucoseLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlucoseLevelImplCopyWith<_$GlucoseLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
