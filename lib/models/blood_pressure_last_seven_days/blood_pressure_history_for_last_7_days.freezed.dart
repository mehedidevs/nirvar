// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_pressure_history_for_last_7_days.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodPressureHistoryForLast7Days _$BloodPressureHistoryForLast7DaysFromJson(
    Map<String, dynamic> json) {
  return _BloodPressureHistoryForLast7Days.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureHistoryForLast7Days {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, BloodPressureSummary>? get data =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_systolic')
  int? get avgSystolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_diastolic')
  int? get avgDiastolic => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureHistoryForLast7Days to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureHistoryForLast7Days
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureHistoryForLast7DaysCopyWith<BloodPressureHistoryForLast7Days>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureHistoryForLast7DaysCopyWith<$Res> {
  factory $BloodPressureHistoryForLast7DaysCopyWith(
          BloodPressureHistoryForLast7Days value,
          $Res Function(BloodPressureHistoryForLast7Days) then) =
      _$BloodPressureHistoryForLast7DaysCopyWithImpl<$Res,
          BloodPressureHistoryForLast7Days>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      Map<String, BloodPressureSummary>? data,
      @JsonKey(name: 'avg_systolic') int? avgSystolic,
      @JsonKey(name: 'avg_diastolic') int? avgDiastolic});
}

/// @nodoc
class _$BloodPressureHistoryForLast7DaysCopyWithImpl<$Res,
        $Val extends BloodPressureHistoryForLast7Days>
    implements $BloodPressureHistoryForLast7DaysCopyWith<$Res> {
  _$BloodPressureHistoryForLast7DaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureHistoryForLast7Days
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? avgSystolic = freezed,
    Object? avgDiastolic = freezed,
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
              as Map<String, BloodPressureSummary>?,
      avgSystolic: freezed == avgSystolic
          ? _value.avgSystolic
          : avgSystolic // ignore: cast_nullable_to_non_nullable
              as int?,
      avgDiastolic: freezed == avgDiastolic
          ? _value.avgDiastolic
          : avgDiastolic // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodPressureHistoryForLast7DaysImplCopyWith<$Res>
    implements $BloodPressureHistoryForLast7DaysCopyWith<$Res> {
  factory _$$BloodPressureHistoryForLast7DaysImplCopyWith(
          _$BloodPressureHistoryForLast7DaysImpl value,
          $Res Function(_$BloodPressureHistoryForLast7DaysImpl) then) =
      __$$BloodPressureHistoryForLast7DaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      Map<String, BloodPressureSummary>? data,
      @JsonKey(name: 'avg_systolic') int? avgSystolic,
      @JsonKey(name: 'avg_diastolic') int? avgDiastolic});
}

/// @nodoc
class __$$BloodPressureHistoryForLast7DaysImplCopyWithImpl<$Res>
    extends _$BloodPressureHistoryForLast7DaysCopyWithImpl<$Res,
        _$BloodPressureHistoryForLast7DaysImpl>
    implements _$$BloodPressureHistoryForLast7DaysImplCopyWith<$Res> {
  __$$BloodPressureHistoryForLast7DaysImplCopyWithImpl(
      _$BloodPressureHistoryForLast7DaysImpl _value,
      $Res Function(_$BloodPressureHistoryForLast7DaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureHistoryForLast7Days
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? avgSystolic = freezed,
    Object? avgDiastolic = freezed,
  }) {
    return _then(_$BloodPressureHistoryForLast7DaysImpl(
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
              as Map<String, BloodPressureSummary>?,
      avgSystolic: freezed == avgSystolic
          ? _value.avgSystolic
          : avgSystolic // ignore: cast_nullable_to_non_nullable
              as int?,
      avgDiastolic: freezed == avgDiastolic
          ? _value.avgDiastolic
          : avgDiastolic // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodPressureHistoryForLast7DaysImpl
    implements _BloodPressureHistoryForLast7Days {
  const _$BloodPressureHistoryForLast7DaysImpl(
      {this.status,
      this.message,
      final Map<String, BloodPressureSummary>? data,
      @JsonKey(name: 'avg_systolic') this.avgSystolic,
      @JsonKey(name: 'avg_diastolic') this.avgDiastolic})
      : _data = data;

  factory _$BloodPressureHistoryForLast7DaysImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BloodPressureHistoryForLast7DaysImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final Map<String, BloodPressureSummary>? _data;
  @override
  Map<String, BloodPressureSummary>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'avg_systolic')
  final int? avgSystolic;
  @override
  @JsonKey(name: 'avg_diastolic')
  final int? avgDiastolic;

  @override
  String toString() {
    return 'BloodPressureHistoryForLast7Days(status: $status, message: $message, data: $data, avgSystolic: $avgSystolic, avgDiastolic: $avgDiastolic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureHistoryForLast7DaysImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.avgSystolic, avgSystolic) ||
                other.avgSystolic == avgSystolic) &&
            (identical(other.avgDiastolic, avgDiastolic) ||
                other.avgDiastolic == avgDiastolic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_data), avgSystolic, avgDiastolic);

  /// Create a copy of BloodPressureHistoryForLast7Days
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureHistoryForLast7DaysImplCopyWith<
          _$BloodPressureHistoryForLast7DaysImpl>
      get copyWith => __$$BloodPressureHistoryForLast7DaysImplCopyWithImpl<
          _$BloodPressureHistoryForLast7DaysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureHistoryForLast7DaysImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureHistoryForLast7Days
    implements BloodPressureHistoryForLast7Days {
  const factory _BloodPressureHistoryForLast7Days(
          {final int? status,
          final String? message,
          final Map<String, BloodPressureSummary>? data,
          @JsonKey(name: 'avg_systolic') final int? avgSystolic,
          @JsonKey(name: 'avg_diastolic') final int? avgDiastolic}) =
      _$BloodPressureHistoryForLast7DaysImpl;

  factory _BloodPressureHistoryForLast7Days.fromJson(
          Map<String, dynamic> json) =
      _$BloodPressureHistoryForLast7DaysImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  Map<String, BloodPressureSummary>? get data;
  @override
  @JsonKey(name: 'avg_systolic')
  int? get avgSystolic;
  @override
  @JsonKey(name: 'avg_diastolic')
  int? get avgDiastolic;

  /// Create a copy of BloodPressureHistoryForLast7Days
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureHistoryForLast7DaysImplCopyWith<
          _$BloodPressureHistoryForLast7DaysImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BloodPressureSummary _$BloodPressureSummaryFromJson(Map<String, dynamic> json) {
  return _BloodPressureSummary.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureSummary {
  @JsonKey(name: 'systolic_avg')
  int? get systolicAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_avg')
  int? get diastolicAvg => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureSummaryCopyWith<BloodPressureSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureSummaryCopyWith<$Res> {
  factory $BloodPressureSummaryCopyWith(BloodPressureSummary value,
          $Res Function(BloodPressureSummary) then) =
      _$BloodPressureSummaryCopyWithImpl<$Res, BloodPressureSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'systolic_avg') int? systolicAvg,
      @JsonKey(name: 'diastolic_avg') int? diastolicAvg,
      String? category});
}

/// @nodoc
class _$BloodPressureSummaryCopyWithImpl<$Res,
        $Val extends BloodPressureSummary>
    implements $BloodPressureSummaryCopyWith<$Res> {
  _$BloodPressureSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systolicAvg = freezed,
    Object? diastolicAvg = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      systolicAvg: freezed == systolicAvg
          ? _value.systolicAvg
          : systolicAvg // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolicAvg: freezed == diastolicAvg
          ? _value.diastolicAvg
          : diastolicAvg // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodPressureSummaryImplCopyWith<$Res>
    implements $BloodPressureSummaryCopyWith<$Res> {
  factory _$$BloodPressureSummaryImplCopyWith(_$BloodPressureSummaryImpl value,
          $Res Function(_$BloodPressureSummaryImpl) then) =
      __$$BloodPressureSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'systolic_avg') int? systolicAvg,
      @JsonKey(name: 'diastolic_avg') int? diastolicAvg,
      String? category});
}

/// @nodoc
class __$$BloodPressureSummaryImplCopyWithImpl<$Res>
    extends _$BloodPressureSummaryCopyWithImpl<$Res, _$BloodPressureSummaryImpl>
    implements _$$BloodPressureSummaryImplCopyWith<$Res> {
  __$$BloodPressureSummaryImplCopyWithImpl(_$BloodPressureSummaryImpl _value,
      $Res Function(_$BloodPressureSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systolicAvg = freezed,
    Object? diastolicAvg = freezed,
    Object? category = freezed,
  }) {
    return _then(_$BloodPressureSummaryImpl(
      systolicAvg: freezed == systolicAvg
          ? _value.systolicAvg
          : systolicAvg // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolicAvg: freezed == diastolicAvg
          ? _value.diastolicAvg
          : diastolicAvg // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodPressureSummaryImpl implements _BloodPressureSummary {
  const _$BloodPressureSummaryImpl(
      {@JsonKey(name: 'systolic_avg') this.systolicAvg,
      @JsonKey(name: 'diastolic_avg') this.diastolicAvg,
      this.category});

  factory _$BloodPressureSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodPressureSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'systolic_avg')
  final int? systolicAvg;
  @override
  @JsonKey(name: 'diastolic_avg')
  final int? diastolicAvg;
  @override
  final String? category;

  @override
  String toString() {
    return 'BloodPressureSummary(systolicAvg: $systolicAvg, diastolicAvg: $diastolicAvg, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureSummaryImpl &&
            (identical(other.systolicAvg, systolicAvg) ||
                other.systolicAvg == systolicAvg) &&
            (identical(other.diastolicAvg, diastolicAvg) ||
                other.diastolicAvg == diastolicAvg) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, systolicAvg, diastolicAvg, category);

  /// Create a copy of BloodPressureSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureSummaryImplCopyWith<_$BloodPressureSummaryImpl>
      get copyWith =>
          __$$BloodPressureSummaryImplCopyWithImpl<_$BloodPressureSummaryImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureSummaryImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureSummary implements BloodPressureSummary {
  const factory _BloodPressureSummary(
      {@JsonKey(name: 'systolic_avg') final int? systolicAvg,
      @JsonKey(name: 'diastolic_avg') final int? diastolicAvg,
      final String? category}) = _$BloodPressureSummaryImpl;

  factory _BloodPressureSummary.fromJson(Map<String, dynamic> json) =
      _$BloodPressureSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'systolic_avg')
  int? get systolicAvg;
  @override
  @JsonKey(name: 'diastolic_avg')
  int? get diastolicAvg;
  @override
  String? get category;

  /// Create a copy of BloodPressureSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureSummaryImplCopyWith<_$BloodPressureSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
