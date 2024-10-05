// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'glucose_level_for_past_seven_days.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlucoseLevelForPastSevenDays _$GlucoseLevelForPastSevenDaysFromJson(
    Map<String, dynamic> json) {
  return _GlucoseLevelForPastSevenDays.fromJson(json);
}

/// @nodoc
mixin _$GlucoseLevelForPastSevenDays {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, GlucoseValues>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_level')
  String? get avgLevel => throw _privateConstructorUsedError;

  /// Serializes this GlucoseLevelForPastSevenDays to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlucoseLevelForPastSevenDays
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlucoseLevelForPastSevenDaysCopyWith<GlucoseLevelForPastSevenDays>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlucoseLevelForPastSevenDaysCopyWith<$Res> {
  factory $GlucoseLevelForPastSevenDaysCopyWith(
          GlucoseLevelForPastSevenDays value,
          $Res Function(GlucoseLevelForPastSevenDays) then) =
      _$GlucoseLevelForPastSevenDaysCopyWithImpl<$Res,
          GlucoseLevelForPastSevenDays>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      Map<String, GlucoseValues>? data,
      @JsonKey(name: 'avg_level') String? avgLevel});
}

/// @nodoc
class _$GlucoseLevelForPastSevenDaysCopyWithImpl<$Res,
        $Val extends GlucoseLevelForPastSevenDays>
    implements $GlucoseLevelForPastSevenDaysCopyWith<$Res> {
  _$GlucoseLevelForPastSevenDaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlucoseLevelForPastSevenDays
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? avgLevel = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, GlucoseValues>?,
      avgLevel: freezed == avgLevel
          ? _value.avgLevel
          : avgLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlucoseLevelForPastSevenDaysImplCopyWith<$Res>
    implements $GlucoseLevelForPastSevenDaysCopyWith<$Res> {
  factory _$$GlucoseLevelForPastSevenDaysImplCopyWith(
          _$GlucoseLevelForPastSevenDaysImpl value,
          $Res Function(_$GlucoseLevelForPastSevenDaysImpl) then) =
      __$$GlucoseLevelForPastSevenDaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      Map<String, GlucoseValues>? data,
      @JsonKey(name: 'avg_level') String? avgLevel});
}

/// @nodoc
class __$$GlucoseLevelForPastSevenDaysImplCopyWithImpl<$Res>
    extends _$GlucoseLevelForPastSevenDaysCopyWithImpl<$Res,
        _$GlucoseLevelForPastSevenDaysImpl>
    implements _$$GlucoseLevelForPastSevenDaysImplCopyWith<$Res> {
  __$$GlucoseLevelForPastSevenDaysImplCopyWithImpl(
      _$GlucoseLevelForPastSevenDaysImpl _value,
      $Res Function(_$GlucoseLevelForPastSevenDaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlucoseLevelForPastSevenDays
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? avgLevel = freezed,
  }) {
    return _then(_$GlucoseLevelForPastSevenDaysImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, GlucoseValues>?,
      avgLevel: freezed == avgLevel
          ? _value.avgLevel
          : avgLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlucoseLevelForPastSevenDaysImpl
    implements _GlucoseLevelForPastSevenDays {
  const _$GlucoseLevelForPastSevenDaysImpl(
      {this.status,
      this.message,
      final Map<String, GlucoseValues>? data,
      @JsonKey(name: 'avg_level') this.avgLevel})
      : _data = data;

  factory _$GlucoseLevelForPastSevenDaysImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GlucoseLevelForPastSevenDaysImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final Map<String, GlucoseValues>? _data;
  @override
  Map<String, GlucoseValues>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'avg_level')
  final String? avgLevel;

  @override
  String toString() {
    return 'GlucoseLevelForPastSevenDays(status: $status, message: $message, data: $data, avgLevel: $avgLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlucoseLevelForPastSevenDaysImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.avgLevel, avgLevel) ||
                other.avgLevel == avgLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_data), avgLevel);

  /// Create a copy of GlucoseLevelForPastSevenDays
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlucoseLevelForPastSevenDaysImplCopyWith<
          _$GlucoseLevelForPastSevenDaysImpl>
      get copyWith => __$$GlucoseLevelForPastSevenDaysImplCopyWithImpl<
          _$GlucoseLevelForPastSevenDaysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlucoseLevelForPastSevenDaysImplToJson(
      this,
    );
  }
}

abstract class _GlucoseLevelForPastSevenDays
    implements GlucoseLevelForPastSevenDays {
  const factory _GlucoseLevelForPastSevenDays(
          {final int? status,
          final String? message,
          final Map<String, GlucoseValues>? data,
          @JsonKey(name: 'avg_level') final String? avgLevel}) =
      _$GlucoseLevelForPastSevenDaysImpl;

  factory _GlucoseLevelForPastSevenDays.fromJson(Map<String, dynamic> json) =
      _$GlucoseLevelForPastSevenDaysImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  Map<String, GlucoseValues>? get data;
  @override
  @JsonKey(name: 'avg_level')
  String? get avgLevel;

  /// Create a copy of GlucoseLevelForPastSevenDays
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlucoseLevelForPastSevenDaysImplCopyWith<
          _$GlucoseLevelForPastSevenDaysImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GlucoseValues _$GlucoseValuesFromJson(Map<String, dynamic> json) {
  return _GlucoseValues.fromJson(json);
}

/// @nodoc
mixin _$GlucoseValues {
  @JsonKey(name: 'value_one')
  double? get valueOne => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_two')
  double? get valueTwo => throw _privateConstructorUsedError;

  /// Serializes this GlucoseValues to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlucoseValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlucoseValuesCopyWith<GlucoseValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlucoseValuesCopyWith<$Res> {
  factory $GlucoseValuesCopyWith(
          GlucoseValues value, $Res Function(GlucoseValues) then) =
      _$GlucoseValuesCopyWithImpl<$Res, GlucoseValues>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value_one') double? valueOne,
      @JsonKey(name: 'value_two') double? valueTwo});
}

/// @nodoc
class _$GlucoseValuesCopyWithImpl<$Res, $Val extends GlucoseValues>
    implements $GlucoseValuesCopyWith<$Res> {
  _$GlucoseValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlucoseValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueOne = freezed,
    Object? valueTwo = freezed,
  }) {
    return _then(_value.copyWith(
      valueOne: freezed == valueOne
          ? _value.valueOne
          : valueOne // ignore: cast_nullable_to_non_nullable
              as double?,
      valueTwo: freezed == valueTwo
          ? _value.valueTwo
          : valueTwo // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlucoseValuesImplCopyWith<$Res>
    implements $GlucoseValuesCopyWith<$Res> {
  factory _$$GlucoseValuesImplCopyWith(
          _$GlucoseValuesImpl value, $Res Function(_$GlucoseValuesImpl) then) =
      __$$GlucoseValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value_one') double? valueOne,
      @JsonKey(name: 'value_two') double? valueTwo});
}

/// @nodoc
class __$$GlucoseValuesImplCopyWithImpl<$Res>
    extends _$GlucoseValuesCopyWithImpl<$Res, _$GlucoseValuesImpl>
    implements _$$GlucoseValuesImplCopyWith<$Res> {
  __$$GlucoseValuesImplCopyWithImpl(
      _$GlucoseValuesImpl _value, $Res Function(_$GlucoseValuesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlucoseValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueOne = freezed,
    Object? valueTwo = freezed,
  }) {
    return _then(_$GlucoseValuesImpl(
      valueOne: freezed == valueOne
          ? _value.valueOne
          : valueOne // ignore: cast_nullable_to_non_nullable
              as double?,
      valueTwo: freezed == valueTwo
          ? _value.valueTwo
          : valueTwo // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlucoseValuesImpl implements _GlucoseValues {
  const _$GlucoseValuesImpl(
      {@JsonKey(name: 'value_one') this.valueOne,
      @JsonKey(name: 'value_two') this.valueTwo});

  factory _$GlucoseValuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlucoseValuesImplFromJson(json);

  @override
  @JsonKey(name: 'value_one')
  final double? valueOne;
  @override
  @JsonKey(name: 'value_two')
  final double? valueTwo;

  @override
  String toString() {
    return 'GlucoseValues(valueOne: $valueOne, valueTwo: $valueTwo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlucoseValuesImpl &&
            (identical(other.valueOne, valueOne) ||
                other.valueOne == valueOne) &&
            (identical(other.valueTwo, valueTwo) ||
                other.valueTwo == valueTwo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valueOne, valueTwo);

  /// Create a copy of GlucoseValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlucoseValuesImplCopyWith<_$GlucoseValuesImpl> get copyWith =>
      __$$GlucoseValuesImplCopyWithImpl<_$GlucoseValuesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlucoseValuesImplToJson(
      this,
    );
  }
}

abstract class _GlucoseValues implements GlucoseValues {
  const factory _GlucoseValues(
          {@JsonKey(name: 'value_one') final double? valueOne,
          @JsonKey(name: 'value_two') final double? valueTwo}) =
      _$GlucoseValuesImpl;

  factory _GlucoseValues.fromJson(Map<String, dynamic> json) =
      _$GlucoseValuesImpl.fromJson;

  @override
  @JsonKey(name: 'value_one')
  double? get valueOne;
  @override
  @JsonKey(name: 'value_two')
  double? get valueTwo;

  /// Create a copy of GlucoseValues
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlucoseValuesImplCopyWith<_$GlucoseValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
