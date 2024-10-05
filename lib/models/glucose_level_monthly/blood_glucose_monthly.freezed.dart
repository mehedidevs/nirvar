// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_glucose_monthly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodGlucoseMonthly _$BloodGlucoseMonthlyFromJson(Map<String, dynamic> json) {
  return _BloodGlucoseMonthly.fromJson(json);
}

/// @nodoc
mixin _$BloodGlucoseMonthly {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, MonthData>? get data => throw _privateConstructorUsedError;

  /// Serializes this BloodGlucoseMonthly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodGlucoseMonthly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodGlucoseMonthlyCopyWith<BloodGlucoseMonthly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodGlucoseMonthlyCopyWith<$Res> {
  factory $BloodGlucoseMonthlyCopyWith(
          BloodGlucoseMonthly value, $Res Function(BloodGlucoseMonthly) then) =
      _$BloodGlucoseMonthlyCopyWithImpl<$Res, BloodGlucoseMonthly>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, MonthData>? data});
}

/// @nodoc
class _$BloodGlucoseMonthlyCopyWithImpl<$Res, $Val extends BloodGlucoseMonthly>
    implements $BloodGlucoseMonthlyCopyWith<$Res> {
  _$BloodGlucoseMonthlyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodGlucoseMonthly
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
              as Map<String, MonthData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodGlucoseMonthlyImplCopyWith<$Res>
    implements $BloodGlucoseMonthlyCopyWith<$Res> {
  factory _$$BloodGlucoseMonthlyImplCopyWith(_$BloodGlucoseMonthlyImpl value,
          $Res Function(_$BloodGlucoseMonthlyImpl) then) =
      __$$BloodGlucoseMonthlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, MonthData>? data});
}

/// @nodoc
class __$$BloodGlucoseMonthlyImplCopyWithImpl<$Res>
    extends _$BloodGlucoseMonthlyCopyWithImpl<$Res, _$BloodGlucoseMonthlyImpl>
    implements _$$BloodGlucoseMonthlyImplCopyWith<$Res> {
  __$$BloodGlucoseMonthlyImplCopyWithImpl(_$BloodGlucoseMonthlyImpl _value,
      $Res Function(_$BloodGlucoseMonthlyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodGlucoseMonthly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BloodGlucoseMonthlyImpl(
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
              as Map<String, MonthData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodGlucoseMonthlyImpl implements _BloodGlucoseMonthly {
  const _$BloodGlucoseMonthlyImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final Map<String, MonthData>? data})
      : _data = data;

  factory _$BloodGlucoseMonthlyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodGlucoseMonthlyImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final Map<String, MonthData>? _data;
  @override
  @JsonKey(name: 'data')
  Map<String, MonthData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BloodGlucoseMonthly(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodGlucoseMonthlyImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BloodGlucoseMonthly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodGlucoseMonthlyImplCopyWith<_$BloodGlucoseMonthlyImpl> get copyWith =>
      __$$BloodGlucoseMonthlyImplCopyWithImpl<_$BloodGlucoseMonthlyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodGlucoseMonthlyImplToJson(
      this,
    );
  }
}

abstract class _BloodGlucoseMonthly implements BloodGlucoseMonthly {
  const factory _BloodGlucoseMonthly(
          {@JsonKey(name: 'status') final int? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final Map<String, MonthData>? data}) =
      _$BloodGlucoseMonthlyImpl;

  factory _BloodGlucoseMonthly.fromJson(Map<String, dynamic> json) =
      _$BloodGlucoseMonthlyImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Map<String, MonthData>? get data;

  /// Create a copy of BloodGlucoseMonthly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodGlucoseMonthlyImplCopyWith<_$BloodGlucoseMonthlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthData _$MonthDataFromJson(Map<String, dynamic> json) {
  return _MonthData.fromJson(json);
}

/// @nodoc
mixin _$MonthData {
  @JsonKey(name: 'avg_level')
  double? get avgLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this MonthData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthDataCopyWith<MonthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthDataCopyWith<$Res> {
  factory $MonthDataCopyWith(MonthData value, $Res Function(MonthData) then) =
      _$MonthDataCopyWithImpl<$Res, MonthData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_level') double? avgLevel,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class _$MonthDataCopyWithImpl<$Res, $Val extends MonthData>
    implements $MonthDataCopyWith<$Res> {
  _$MonthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthData
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
abstract class _$$MonthDataImplCopyWith<$Res>
    implements $MonthDataCopyWith<$Res> {
  factory _$$MonthDataImplCopyWith(
          _$MonthDataImpl value, $Res Function(_$MonthDataImpl) then) =
      __$$MonthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_level') double? avgLevel,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class __$$MonthDataImplCopyWithImpl<$Res>
    extends _$MonthDataCopyWithImpl<$Res, _$MonthDataImpl>
    implements _$$MonthDataImplCopyWith<$Res> {
  __$$MonthDataImplCopyWithImpl(
      _$MonthDataImpl _value, $Res Function(_$MonthDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgLevel = freezed,
    Object? category = freezed,
  }) {
    return _then(_$MonthDataImpl(
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
class _$MonthDataImpl implements _MonthData {
  const _$MonthDataImpl(
      {@JsonKey(name: 'avg_level') this.avgLevel,
      @JsonKey(name: 'category') this.category});

  factory _$MonthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthDataImplFromJson(json);

  @override
  @JsonKey(name: 'avg_level')
  final double? avgLevel;
  @override
  @JsonKey(name: 'category')
  final String? category;

  @override
  String toString() {
    return 'MonthData(avgLevel: $avgLevel, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthDataImpl &&
            (identical(other.avgLevel, avgLevel) ||
                other.avgLevel == avgLevel) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avgLevel, category);

  /// Create a copy of MonthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthDataImplCopyWith<_$MonthDataImpl> get copyWith =>
      __$$MonthDataImplCopyWithImpl<_$MonthDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthDataImplToJson(
      this,
    );
  }
}

abstract class _MonthData implements MonthData {
  const factory _MonthData(
      {@JsonKey(name: 'avg_level') final double? avgLevel,
      @JsonKey(name: 'category') final String? category}) = _$MonthDataImpl;

  factory _MonthData.fromJson(Map<String, dynamic> json) =
      _$MonthDataImpl.fromJson;

  @override
  @JsonKey(name: 'avg_level')
  double? get avgLevel;
  @override
  @JsonKey(name: 'category')
  String? get category;

  /// Create a copy of MonthData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthDataImplCopyWith<_$MonthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
