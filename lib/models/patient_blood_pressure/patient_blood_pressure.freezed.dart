// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_blood_pressure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientBloodPressure _$PatientBloodPressureFromJson(Map<String, dynamic> json) {
  return _PatientBloodPressure.fromJson(json);
}

/// @nodoc
mixin _$PatientBloodPressure {
  @JsonKey(name: 'id')
  int get bpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic')
  int? get systolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic')
  int? get diastolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PatientBloodPressure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientBloodPressure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientBloodPressureCopyWith<PatientBloodPressure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientBloodPressureCopyWith<$Res> {
  factory $PatientBloodPressureCopyWith(PatientBloodPressure value,
          $Res Function(PatientBloodPressure) then) =
      _$PatientBloodPressureCopyWithImpl<$Res, PatientBloodPressure>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int bpId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'systolic') int? systolic,
      @JsonKey(name: 'diastolic') int? diastolic,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PatientBloodPressureCopyWithImpl<$Res,
        $Val extends PatientBloodPressure>
    implements $PatientBloodPressureCopyWith<$Res> {
  _$PatientBloodPressureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientBloodPressure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpId = null,
    Object? userId = null,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      bpId: null == bpId
          ? _value.bpId
          : bpId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientBloodPressureImplCopyWith<$Res>
    implements $PatientBloodPressureCopyWith<$Res> {
  factory _$$PatientBloodPressureImplCopyWith(_$PatientBloodPressureImpl value,
          $Res Function(_$PatientBloodPressureImpl) then) =
      __$$PatientBloodPressureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int bpId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'systolic') int? systolic,
      @JsonKey(name: 'diastolic') int? diastolic,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PatientBloodPressureImplCopyWithImpl<$Res>
    extends _$PatientBloodPressureCopyWithImpl<$Res, _$PatientBloodPressureImpl>
    implements _$$PatientBloodPressureImplCopyWith<$Res> {
  __$$PatientBloodPressureImplCopyWithImpl(_$PatientBloodPressureImpl _value,
      $Res Function(_$PatientBloodPressureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientBloodPressure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpId = null,
    Object? userId = null,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientBloodPressureImpl(
      bpId: null == bpId
          ? _value.bpId
          : bpId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as int?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientBloodPressureImpl implements _PatientBloodPressure {
  const _$PatientBloodPressureImpl(
      {@JsonKey(name: 'id') required this.bpId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'systolic') this.systolic,
      @JsonKey(name: 'diastolic') this.diastolic,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PatientBloodPressureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientBloodPressureImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int bpId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'systolic')
  final int? systolic;
  @override
  @JsonKey(name: 'diastolic')
  final int? diastolic;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatientBloodPressure(bpId: $bpId, userId: $userId, systolic: $systolic, diastolic: $diastolic, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientBloodPressureImpl &&
            (identical(other.bpId, bpId) || other.bpId == bpId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.systolic, systolic) ||
                other.systolic == systolic) &&
            (identical(other.diastolic, diastolic) ||
                other.diastolic == diastolic) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bpId, userId, systolic,
      diastolic, category, createdAt, updatedAt);

  /// Create a copy of PatientBloodPressure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientBloodPressureImplCopyWith<_$PatientBloodPressureImpl>
      get copyWith =>
          __$$PatientBloodPressureImplCopyWithImpl<_$PatientBloodPressureImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientBloodPressureImplToJson(
      this,
    );
  }
}

abstract class _PatientBloodPressure implements PatientBloodPressure {
  const factory _PatientBloodPressure(
          {@JsonKey(name: 'id') required final int bpId,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'systolic') final int? systolic,
          @JsonKey(name: 'diastolic') final int? diastolic,
          @JsonKey(name: 'category') final String? category,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PatientBloodPressureImpl;

  factory _PatientBloodPressure.fromJson(Map<String, dynamic> json) =
      _$PatientBloodPressureImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get bpId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'systolic')
  int? get systolic;
  @override
  @JsonKey(name: 'diastolic')
  int? get diastolic;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PatientBloodPressure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientBloodPressureImplCopyWith<_$PatientBloodPressureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
