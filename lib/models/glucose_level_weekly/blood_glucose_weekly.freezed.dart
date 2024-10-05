// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_glucose_weekly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodGlucoseWeekly _$BloodGlucoseWeeklyFromJson(Map<String, dynamic> json) {
  return _BloodGlucoseWeekly.fromJson(json);
}

/// @nodoc
mixin _$BloodGlucoseWeekly {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, WeekData>? get data => throw _privateConstructorUsedError;

  /// Serializes this BloodGlucoseWeekly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodGlucoseWeekly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodGlucoseWeeklyCopyWith<BloodGlucoseWeekly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodGlucoseWeeklyCopyWith<$Res> {
  factory $BloodGlucoseWeeklyCopyWith(
          BloodGlucoseWeekly value, $Res Function(BloodGlucoseWeekly) then) =
      _$BloodGlucoseWeeklyCopyWithImpl<$Res, BloodGlucoseWeekly>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, WeekData>? data});
}

/// @nodoc
class _$BloodGlucoseWeeklyCopyWithImpl<$Res, $Val extends BloodGlucoseWeekly>
    implements $BloodGlucoseWeeklyCopyWith<$Res> {
  _$BloodGlucoseWeeklyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodGlucoseWeekly
  /// with the given fields replaced by the non-null parameter values.
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
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, WeekData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodGlucoseWeeklyImplCopyWith<$Res>
    implements $BloodGlucoseWeeklyCopyWith<$Res> {
  factory _$$BloodGlucoseWeeklyImplCopyWith(_$BloodGlucoseWeeklyImpl value,
          $Res Function(_$BloodGlucoseWeeklyImpl) then) =
      __$$BloodGlucoseWeeklyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, WeekData>? data});
}

/// @nodoc
class __$$BloodGlucoseWeeklyImplCopyWithImpl<$Res>
    extends _$BloodGlucoseWeeklyCopyWithImpl<$Res, _$BloodGlucoseWeeklyImpl>
    implements _$$BloodGlucoseWeeklyImplCopyWith<$Res> {
  __$$BloodGlucoseWeeklyImplCopyWithImpl(_$BloodGlucoseWeeklyImpl _value,
      $Res Function(_$BloodGlucoseWeeklyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodGlucoseWeekly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BloodGlucoseWeeklyImpl(
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
              as Map<String, WeekData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodGlucoseWeeklyImpl implements _BloodGlucoseWeekly {
  const _$BloodGlucoseWeeklyImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final Map<String, WeekData>? data})
      : _data = data;

  factory _$BloodGlucoseWeeklyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodGlucoseWeeklyImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final Map<String, WeekData>? _data;
  @override
  @JsonKey(name: 'data')
  Map<String, WeekData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BloodGlucoseWeekly(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodGlucoseWeeklyImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BloodGlucoseWeekly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodGlucoseWeeklyImplCopyWith<_$BloodGlucoseWeeklyImpl> get copyWith =>
      __$$BloodGlucoseWeeklyImplCopyWithImpl<_$BloodGlucoseWeeklyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodGlucoseWeeklyImplToJson(
      this,
    );
  }
}

abstract class _BloodGlucoseWeekly implements BloodGlucoseWeekly {
  const factory _BloodGlucoseWeekly(
          {@JsonKey(name: 'status') final int? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final Map<String, WeekData>? data}) =
      _$BloodGlucoseWeeklyImpl;

  factory _BloodGlucoseWeekly.fromJson(Map<String, dynamic> json) =
      _$BloodGlucoseWeeklyImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Map<String, WeekData>? get data;

  /// Create a copy of BloodGlucoseWeekly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodGlucoseWeeklyImplCopyWith<_$BloodGlucoseWeeklyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeekData _$WeekDataFromJson(Map<String, dynamic> json) {
  return _WeekData.fromJson(json);
}

/// @nodoc
mixin _$WeekData {
  @JsonKey(name: 'avg_level')
  double? get avgLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this WeekData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekDataCopyWith<WeekData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDataCopyWith<$Res> {
  factory $WeekDataCopyWith(WeekData value, $Res Function(WeekData) then) =
      _$WeekDataCopyWithImpl<$Res, WeekData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_level') double? avgLevel,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class _$WeekDataCopyWithImpl<$Res, $Val extends WeekData>
    implements $WeekDataCopyWith<$Res> {
  _$WeekDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgLevel = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      avgLevel: freezed == avgLevel
          ? _value.avgLevel
          : avgLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekDataImplCopyWith<$Res>
    implements $WeekDataCopyWith<$Res> {
  factory _$$WeekDataImplCopyWith(
          _$WeekDataImpl value, $Res Function(_$WeekDataImpl) then) =
      __$$WeekDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_level') double? avgLevel,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class __$$WeekDataImplCopyWithImpl<$Res>
    extends _$WeekDataCopyWithImpl<$Res, _$WeekDataImpl>
    implements _$$WeekDataImplCopyWith<$Res> {
  __$$WeekDataImplCopyWithImpl(
      _$WeekDataImpl _value, $Res Function(_$WeekDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgLevel = freezed,
    Object? category = freezed,
  }) {
    return _then(_$WeekDataImpl(
      avgLevel: freezed == avgLevel
          ? _value.avgLevel
          : avgLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekDataImpl implements _WeekData {
  const _$WeekDataImpl(
      {@JsonKey(name: 'avg_level') this.avgLevel,
      @JsonKey(name: 'category') this.category});

  factory _$WeekDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekDataImplFromJson(json);

  @override
  @JsonKey(name: 'avg_level')
  final double? avgLevel;
  @override
  @JsonKey(name: 'category')
  final String? category;

  @override
  String toString() {
    return 'WeekData(avgLevel: $avgLevel, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDataImpl &&
            (identical(other.avgLevel, avgLevel) ||
                other.avgLevel == avgLevel) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avgLevel, category);

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekDataImplCopyWith<_$WeekDataImpl> get copyWith =>
      __$$WeekDataImplCopyWithImpl<_$WeekDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekDataImplToJson(
      this,
    );
  }
}

abstract class _WeekData implements WeekData {
  const factory _WeekData(
      {@JsonKey(name: 'avg_level') final double? avgLevel,
      @JsonKey(name: 'category') final String? category}) = _$WeekDataImpl;

  factory _WeekData.fromJson(Map<String, dynamic> json) =
      _$WeekDataImpl.fromJson;

  @override
  @JsonKey(name: 'avg_level')
  double? get avgLevel;
  @override
  @JsonKey(name: 'category')
  String? get category;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekDataImplCopyWith<_$WeekDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
