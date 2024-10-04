// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_pressure_summary_monthly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodPressureSummaryMonthly _$BloodPressureSummaryMonthlyFromJson(
    Map<String, dynamic> json) {
  return _BloodPressureSummaryMonthly.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureSummaryMonthly {
  Map<String, BloodPressureMonth>? get data =>
      throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureSummaryMonthly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureSummaryMonthly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureSummaryMonthlyCopyWith<BloodPressureSummaryMonthly>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureSummaryMonthlyCopyWith<$Res> {
  factory $BloodPressureSummaryMonthlyCopyWith(
          BloodPressureSummaryMonthly value,
          $Res Function(BloodPressureSummaryMonthly) then) =
      _$BloodPressureSummaryMonthlyCopyWithImpl<$Res,
          BloodPressureSummaryMonthly>;
  @useResult
  $Res call(
      {Map<String, BloodPressureMonth>? data, int? status, String? message});
}

/// @nodoc
class _$BloodPressureSummaryMonthlyCopyWithImpl<$Res,
        $Val extends BloodPressureSummaryMonthly>
    implements $BloodPressureSummaryMonthlyCopyWith<$Res> {
  _$BloodPressureSummaryMonthlyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureSummaryMonthly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, BloodPressureMonth>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodPressureSummaryMonthlyImplCopyWith<$Res>
    implements $BloodPressureSummaryMonthlyCopyWith<$Res> {
  factory _$$BloodPressureSummaryMonthlyImplCopyWith(
          _$BloodPressureSummaryMonthlyImpl value,
          $Res Function(_$BloodPressureSummaryMonthlyImpl) then) =
      __$$BloodPressureSummaryMonthlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, BloodPressureMonth>? data, int? status, String? message});
}

/// @nodoc
class __$$BloodPressureSummaryMonthlyImplCopyWithImpl<$Res>
    extends _$BloodPressureSummaryMonthlyCopyWithImpl<$Res,
        _$BloodPressureSummaryMonthlyImpl>
    implements _$$BloodPressureSummaryMonthlyImplCopyWith<$Res> {
  __$$BloodPressureSummaryMonthlyImplCopyWithImpl(
      _$BloodPressureSummaryMonthlyImpl _value,
      $Res Function(_$BloodPressureSummaryMonthlyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureSummaryMonthly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BloodPressureSummaryMonthlyImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, BloodPressureMonth>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodPressureSummaryMonthlyImpl
    implements _BloodPressureSummaryMonthly {
  const _$BloodPressureSummaryMonthlyImpl(
      {required final Map<String, BloodPressureMonth>? data,
      this.status,
      this.message})
      : _data = data;

  factory _$BloodPressureSummaryMonthlyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BloodPressureSummaryMonthlyImplFromJson(json);

  final Map<String, BloodPressureMonth>? _data;
  @override
  Map<String, BloodPressureMonth>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'BloodPressureSummaryMonthly(data: $data, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureSummaryMonthlyImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), status, message);

  /// Create a copy of BloodPressureSummaryMonthly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureSummaryMonthlyImplCopyWith<_$BloodPressureSummaryMonthlyImpl>
      get copyWith => __$$BloodPressureSummaryMonthlyImplCopyWithImpl<
          _$BloodPressureSummaryMonthlyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureSummaryMonthlyImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureSummaryMonthly
    implements BloodPressureSummaryMonthly {
  const factory _BloodPressureSummaryMonthly(
      {required final Map<String, BloodPressureMonth>? data,
      final int? status,
      final String? message}) = _$BloodPressureSummaryMonthlyImpl;

  factory _BloodPressureSummaryMonthly.fromJson(Map<String, dynamic> json) =
      _$BloodPressureSummaryMonthlyImpl.fromJson;

  @override
  Map<String, BloodPressureMonth>? get data;
  @override
  int? get status;
  @override
  String? get message;

  /// Create a copy of BloodPressureSummaryMonthly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureSummaryMonthlyImplCopyWith<_$BloodPressureSummaryMonthlyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BloodPressureMonth _$BloodPressureMonthFromJson(Map<String, dynamic> json) {
  return _BloodPressureMonth.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureMonth {
  @JsonKey(name: 'avg_systolic')
  String? get avgSystolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_diastolic')
  String? get avgDiastolic => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureMonth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureMonthCopyWith<BloodPressureMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureMonthCopyWith<$Res> {
  factory $BloodPressureMonthCopyWith(
          BloodPressureMonth value, $Res Function(BloodPressureMonth) then) =
      _$BloodPressureMonthCopyWithImpl<$Res, BloodPressureMonth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_systolic') String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
      String? category});
}

/// @nodoc
class _$BloodPressureMonthCopyWithImpl<$Res, $Val extends BloodPressureMonth>
    implements $BloodPressureMonthCopyWith<$Res> {
  _$BloodPressureMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgSystolic = freezed,
    Object? avgDiastolic = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      avgSystolic: freezed == avgSystolic
          ? _value.avgSystolic
          : avgSystolic // ignore: cast_nullable_to_non_nullable
              as String?,
      avgDiastolic: freezed == avgDiastolic
          ? _value.avgDiastolic
          : avgDiastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodPressureMonthImplCopyWith<$Res>
    implements $BloodPressureMonthCopyWith<$Res> {
  factory _$$BloodPressureMonthImplCopyWith(_$BloodPressureMonthImpl value,
          $Res Function(_$BloodPressureMonthImpl) then) =
      __$$BloodPressureMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_systolic') String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
      String? category});
}

/// @nodoc
class __$$BloodPressureMonthImplCopyWithImpl<$Res>
    extends _$BloodPressureMonthCopyWithImpl<$Res, _$BloodPressureMonthImpl>
    implements _$$BloodPressureMonthImplCopyWith<$Res> {
  __$$BloodPressureMonthImplCopyWithImpl(_$BloodPressureMonthImpl _value,
      $Res Function(_$BloodPressureMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgSystolic = freezed,
    Object? avgDiastolic = freezed,
    Object? category = freezed,
  }) {
    return _then(_$BloodPressureMonthImpl(
      avgSystolic: freezed == avgSystolic
          ? _value.avgSystolic
          : avgSystolic // ignore: cast_nullable_to_non_nullable
              as String?,
      avgDiastolic: freezed == avgDiastolic
          ? _value.avgDiastolic
          : avgDiastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodPressureMonthImpl implements _BloodPressureMonth {
  const _$BloodPressureMonthImpl(
      {@JsonKey(name: 'avg_systolic') this.avgSystolic,
      @JsonKey(name: 'avg_diastolic') this.avgDiastolic,
      this.category});

  factory _$BloodPressureMonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodPressureMonthImplFromJson(json);

  @override
  @JsonKey(name: 'avg_systolic')
  final String? avgSystolic;
  @override
  @JsonKey(name: 'avg_diastolic')
  final String? avgDiastolic;
  @override
  final String? category;

  @override
  String toString() {
    return 'BloodPressureMonth(avgSystolic: $avgSystolic, avgDiastolic: $avgDiastolic, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureMonthImpl &&
            (identical(other.avgSystolic, avgSystolic) ||
                other.avgSystolic == avgSystolic) &&
            (identical(other.avgDiastolic, avgDiastolic) ||
                other.avgDiastolic == avgDiastolic) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, avgSystolic, avgDiastolic, category);

  /// Create a copy of BloodPressureMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureMonthImplCopyWith<_$BloodPressureMonthImpl> get copyWith =>
      __$$BloodPressureMonthImplCopyWithImpl<_$BloodPressureMonthImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureMonthImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureMonth implements BloodPressureMonth {
  const factory _BloodPressureMonth(
      {@JsonKey(name: 'avg_systolic') final String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') final String? avgDiastolic,
      final String? category}) = _$BloodPressureMonthImpl;

  factory _BloodPressureMonth.fromJson(Map<String, dynamic> json) =
      _$BloodPressureMonthImpl.fromJson;

  @override
  @JsonKey(name: 'avg_systolic')
  String? get avgSystolic;
  @override
  @JsonKey(name: 'avg_diastolic')
  String? get avgDiastolic;
  @override
  String? get category;

  /// Create a copy of BloodPressureMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureMonthImplCopyWith<_$BloodPressureMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
