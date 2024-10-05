// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_glucose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientGlucose _$PatientGlucoseFromJson(Map<String, dynamic> json) {
  return _PatientGlucose.fromJson(json);
}

/// @nodoc
mixin _$PatientGlucose {
  @JsonKey(name: 'id')
  int get glucoseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_sugar_level')
  int? get bloodSugarLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PatientGlucose to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientGlucose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientGlucoseCopyWith<PatientGlucose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientGlucoseCopyWith<$Res> {
  factory $PatientGlucoseCopyWith(
          PatientGlucose value, $Res Function(PatientGlucose) then) =
      _$PatientGlucoseCopyWithImpl<$Res, PatientGlucose>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int glucoseId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'blood_sugar_level') int? bloodSugarLevel,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PatientGlucoseCopyWithImpl<$Res, $Val extends PatientGlucose>
    implements $PatientGlucoseCopyWith<$Res> {
  _$PatientGlucoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientGlucose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? glucoseId = null,
    Object? userId = null,
    Object? bloodSugarLevel = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      glucoseId: null == glucoseId
          ? _value.glucoseId
          : glucoseId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bloodSugarLevel: freezed == bloodSugarLevel
          ? _value.bloodSugarLevel
          : bloodSugarLevel // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PatientGlucoseImplCopyWith<$Res>
    implements $PatientGlucoseCopyWith<$Res> {
  factory _$$PatientGlucoseImplCopyWith(_$PatientGlucoseImpl value,
          $Res Function(_$PatientGlucoseImpl) then) =
      __$$PatientGlucoseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int glucoseId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'blood_sugar_level') int? bloodSugarLevel,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PatientGlucoseImplCopyWithImpl<$Res>
    extends _$PatientGlucoseCopyWithImpl<$Res, _$PatientGlucoseImpl>
    implements _$$PatientGlucoseImplCopyWith<$Res> {
  __$$PatientGlucoseImplCopyWithImpl(
      _$PatientGlucoseImpl _value, $Res Function(_$PatientGlucoseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientGlucose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? glucoseId = null,
    Object? userId = null,
    Object? bloodSugarLevel = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientGlucoseImpl(
      glucoseId: null == glucoseId
          ? _value.glucoseId
          : glucoseId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bloodSugarLevel: freezed == bloodSugarLevel
          ? _value.bloodSugarLevel
          : bloodSugarLevel // ignore: cast_nullable_to_non_nullable
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
class _$PatientGlucoseImpl implements _PatientGlucose {
  const _$PatientGlucoseImpl(
      {@JsonKey(name: 'id') required this.glucoseId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'blood_sugar_level') this.bloodSugarLevel,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PatientGlucoseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientGlucoseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int glucoseId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'blood_sugar_level')
  final int? bloodSugarLevel;
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
    return 'PatientGlucose(glucoseId: $glucoseId, userId: $userId, bloodSugarLevel: $bloodSugarLevel, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientGlucoseImpl &&
            (identical(other.glucoseId, glucoseId) ||
                other.glucoseId == glucoseId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bloodSugarLevel, bloodSugarLevel) ||
                other.bloodSugarLevel == bloodSugarLevel) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, glucoseId, userId,
      bloodSugarLevel, category, createdAt, updatedAt);

  /// Create a copy of PatientGlucose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientGlucoseImplCopyWith<_$PatientGlucoseImpl> get copyWith =>
      __$$PatientGlucoseImplCopyWithImpl<_$PatientGlucoseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientGlucoseImplToJson(
      this,
    );
  }
}

abstract class _PatientGlucose implements PatientGlucose {
  const factory _PatientGlucose(
          {@JsonKey(name: 'id') required final int glucoseId,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'blood_sugar_level') final int? bloodSugarLevel,
          @JsonKey(name: 'category') final String? category,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PatientGlucoseImpl;

  factory _PatientGlucose.fromJson(Map<String, dynamic> json) =
      _$PatientGlucoseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get glucoseId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'blood_sugar_level')
  int? get bloodSugarLevel;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PatientGlucose
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientGlucoseImplCopyWith<_$PatientGlucoseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
