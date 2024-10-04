// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_pressure_summary_weekly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodPressureSummaryWeekly _$BloodPressureSummaryWeeklyFromJson(
    Map<String, dynamic> json) {
  return _BloodPressureSummaryWeekly.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureSummaryWeekly {
  Map<String, BloodPressureWeek>? get data =>
      throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureSummaryWeekly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureSummaryWeekly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureSummaryWeeklyCopyWith<BloodPressureSummaryWeekly>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureSummaryWeeklyCopyWith<$Res> {
  factory $BloodPressureSummaryWeeklyCopyWith(BloodPressureSummaryWeekly value,
          $Res Function(BloodPressureSummaryWeekly) then) =
      _$BloodPressureSummaryWeeklyCopyWithImpl<$Res,
          BloodPressureSummaryWeekly>;
  @useResult
  $Res call(
      {Map<String, BloodPressureWeek>? data, int? status, String? message});
}

/// @nodoc
class _$BloodPressureSummaryWeeklyCopyWithImpl<$Res,
        $Val extends BloodPressureSummaryWeekly>
    implements $BloodPressureSummaryWeeklyCopyWith<$Res> {
  _$BloodPressureSummaryWeeklyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureSummaryWeekly
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
              as Map<String, BloodPressureWeek>?,
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
abstract class _$$BloodPressureSummaryWeeklyImplCopyWith<$Res>
    implements $BloodPressureSummaryWeeklyCopyWith<$Res> {
  factory _$$BloodPressureSummaryWeeklyImplCopyWith(
          _$BloodPressureSummaryWeeklyImpl value,
          $Res Function(_$BloodPressureSummaryWeeklyImpl) then) =
      __$$BloodPressureSummaryWeeklyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, BloodPressureWeek>? data, int? status, String? message});
}

/// @nodoc
class __$$BloodPressureSummaryWeeklyImplCopyWithImpl<$Res>
    extends _$BloodPressureSummaryWeeklyCopyWithImpl<$Res,
        _$BloodPressureSummaryWeeklyImpl>
    implements _$$BloodPressureSummaryWeeklyImplCopyWith<$Res> {
  __$$BloodPressureSummaryWeeklyImplCopyWithImpl(
      _$BloodPressureSummaryWeeklyImpl _value,
      $Res Function(_$BloodPressureSummaryWeeklyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureSummaryWeekly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BloodPressureSummaryWeeklyImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, BloodPressureWeek>?,
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
class _$BloodPressureSummaryWeeklyImpl implements _BloodPressureSummaryWeekly {
  const _$BloodPressureSummaryWeeklyImpl(
      {required final Map<String, BloodPressureWeek>? data,
      this.status,
      this.message})
      : _data = data;

  factory _$BloodPressureSummaryWeeklyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BloodPressureSummaryWeeklyImplFromJson(json);

  final Map<String, BloodPressureWeek>? _data;
  @override
  Map<String, BloodPressureWeek>? get data {
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
    return 'BloodPressureSummaryWeekly(data: $data, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureSummaryWeeklyImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), status, message);

  /// Create a copy of BloodPressureSummaryWeekly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureSummaryWeeklyImplCopyWith<_$BloodPressureSummaryWeeklyImpl>
      get copyWith => __$$BloodPressureSummaryWeeklyImplCopyWithImpl<
          _$BloodPressureSummaryWeeklyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureSummaryWeeklyImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureSummaryWeekly
    implements BloodPressureSummaryWeekly {
  const factory _BloodPressureSummaryWeekly(
      {required final Map<String, BloodPressureWeek>? data,
      final int? status,
      final String? message}) = _$BloodPressureSummaryWeeklyImpl;

  factory _BloodPressureSummaryWeekly.fromJson(Map<String, dynamic> json) =
      _$BloodPressureSummaryWeeklyImpl.fromJson;

  @override
  Map<String, BloodPressureWeek>? get data;
  @override
  int? get status;
  @override
  String? get message;

  /// Create a copy of BloodPressureSummaryWeekly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureSummaryWeeklyImplCopyWith<_$BloodPressureSummaryWeeklyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BloodPressureWeek _$BloodPressureWeekFromJson(Map<String, dynamic> json) {
  return _BloodPressureWeek.fromJson(json);
}

/// @nodoc
mixin _$BloodPressureWeek {
  @JsonKey(name: 'avg_systolic')
  String? get avgSystolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_diastolic')
  String? get avgDiastolic => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this BloodPressureWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodPressureWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodPressureWeekCopyWith<BloodPressureWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodPressureWeekCopyWith<$Res> {
  factory $BloodPressureWeekCopyWith(
          BloodPressureWeek value, $Res Function(BloodPressureWeek) then) =
      _$BloodPressureWeekCopyWithImpl<$Res, BloodPressureWeek>;
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_systolic') String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
      String? category});
}

/// @nodoc
class _$BloodPressureWeekCopyWithImpl<$Res, $Val extends BloodPressureWeek>
    implements $BloodPressureWeekCopyWith<$Res> {
  _$BloodPressureWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodPressureWeek
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
abstract class _$$BloodPressureWeekImplCopyWith<$Res>
    implements $BloodPressureWeekCopyWith<$Res> {
  factory _$$BloodPressureWeekImplCopyWith(_$BloodPressureWeekImpl value,
          $Res Function(_$BloodPressureWeekImpl) then) =
      __$$BloodPressureWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'avg_systolic') String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
      String? category});
}

/// @nodoc
class __$$BloodPressureWeekImplCopyWithImpl<$Res>
    extends _$BloodPressureWeekCopyWithImpl<$Res, _$BloodPressureWeekImpl>
    implements _$$BloodPressureWeekImplCopyWith<$Res> {
  __$$BloodPressureWeekImplCopyWithImpl(_$BloodPressureWeekImpl _value,
      $Res Function(_$BloodPressureWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodPressureWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgSystolic = freezed,
    Object? avgDiastolic = freezed,
    Object? category = freezed,
  }) {
    return _then(_$BloodPressureWeekImpl(
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
class _$BloodPressureWeekImpl implements _BloodPressureWeek {
  const _$BloodPressureWeekImpl(
      {@JsonKey(name: 'avg_systolic') this.avgSystolic,
      @JsonKey(name: 'avg_diastolic') this.avgDiastolic,
      this.category});

  factory _$BloodPressureWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodPressureWeekImplFromJson(json);

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
    return 'BloodPressureWeek(avgSystolic: $avgSystolic, avgDiastolic: $avgDiastolic, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodPressureWeekImpl &&
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

  /// Create a copy of BloodPressureWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodPressureWeekImplCopyWith<_$BloodPressureWeekImpl> get copyWith =>
      __$$BloodPressureWeekImplCopyWithImpl<_$BloodPressureWeekImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodPressureWeekImplToJson(
      this,
    );
  }
}

abstract class _BloodPressureWeek implements BloodPressureWeek {
  const factory _BloodPressureWeek(
      {@JsonKey(name: 'avg_systolic') final String? avgSystolic,
      @JsonKey(name: 'avg_diastolic') final String? avgDiastolic,
      final String? category}) = _$BloodPressureWeekImpl;

  factory _BloodPressureWeek.fromJson(Map<String, dynamic> json) =
      _$BloodPressureWeekImpl.fromJson;

  @override
  @JsonKey(name: 'avg_systolic')
  String? get avgSystolic;
  @override
  @JsonKey(name: 'avg_diastolic')
  String? get avgDiastolic;
  @override
  String? get category;

  /// Create a copy of BloodPressureWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodPressureWeekImplCopyWith<_$BloodPressureWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
