// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientFolder _$PatientFolderFromJson(Map<String, dynamic> json) {
  return _PatientFolder.fromJson(json);
}

/// @nodoc
mixin _$PatientFolder {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  int? get fileCount => throw _privateConstructorUsedError;

  /// Serializes this PatientFolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientFolderCopyWith<PatientFolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientFolderCopyWith<$Res> {
  factory $PatientFolderCopyWith(
          PatientFolder value, $Res Function(PatientFolder) then) =
      _$PatientFolderCopyWithImpl<$Res, PatientFolder>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'user_id') int userId,
      int id,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      int? fileCount});
}

/// @nodoc
class _$PatientFolderCopyWithImpl<$Res, $Val extends PatientFolder>
    implements $PatientFolderCopyWith<$Res> {
  _$PatientFolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? userId = null,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? fileCount = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCount: freezed == fileCount
          ? _value.fileCount
          : fileCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientFolderImplCopyWith<$Res>
    implements $PatientFolderCopyWith<$Res> {
  factory _$$PatientFolderImplCopyWith(
          _$PatientFolderImpl value, $Res Function(_$PatientFolderImpl) then) =
      __$$PatientFolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'user_id') int userId,
      int id,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      int? fileCount});
}

/// @nodoc
class __$$PatientFolderImplCopyWithImpl<$Res>
    extends _$PatientFolderCopyWithImpl<$Res, _$PatientFolderImpl>
    implements _$$PatientFolderImplCopyWith<$Res> {
  __$$PatientFolderImplCopyWithImpl(
      _$PatientFolderImpl _value, $Res Function(_$PatientFolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? userId = null,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? fileCount = freezed,
  }) {
    return _then(_$PatientFolderImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCount: freezed == fileCount
          ? _value.fileCount
          : fileCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientFolderImpl implements _PatientFolder {
  const _$PatientFolderImpl(
      {required this.name,
      @JsonKey(name: 'user_id') required this.userId,
      required this.id,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      this.fileCount});

  factory _$PatientFolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientFolderImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int id;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final int? fileCount;

  @override
  String toString() {
    return 'PatientFolder(name: $name, userId: $userId, id: $id, updatedAt: $updatedAt, createdAt: $createdAt, fileCount: $fileCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientFolderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fileCount, fileCount) ||
                other.fileCount == fileCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, userId, id, updatedAt, createdAt, fileCount);

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientFolderImplCopyWith<_$PatientFolderImpl> get copyWith =>
      __$$PatientFolderImplCopyWithImpl<_$PatientFolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientFolderImplToJson(
      this,
    );
  }
}

abstract class _PatientFolder implements PatientFolder {
  const factory _PatientFolder(
      {required final String name,
      @JsonKey(name: 'user_id') required final int userId,
      required final int id,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'created_at') final String? createdAt,
      final int? fileCount}) = _$PatientFolderImpl;

  factory _PatientFolder.fromJson(Map<String, dynamic> json) =
      _$PatientFolderImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get id;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  int? get fileCount;

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientFolderImplCopyWith<_$PatientFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
