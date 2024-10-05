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
  @JsonKey(name: 'id')
  int get folderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_count')
  int? get fileCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int folderId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'file_count') int? fileCount,
      @JsonKey(name: 'created_at') String? createdAt});
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
    Object? folderId = null,
    Object? userId = freezed,
    Object? name = freezed,
    Object? fileCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCount: freezed == fileCount
          ? _value.fileCount
          : fileCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') int folderId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'file_count') int? fileCount,
      @JsonKey(name: 'created_at') String? createdAt});
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
    Object? folderId = null,
    Object? userId = freezed,
    Object? name = freezed,
    Object? fileCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PatientFolderImpl(
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCount: freezed == fileCount
          ? _value.fileCount
          : fileCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientFolderImpl implements _PatientFolder {
  const _$PatientFolderImpl(
      {@JsonKey(name: 'id') required this.folderId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'file_count') this.fileCount,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$PatientFolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientFolderImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int folderId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'file_count')
  final int? fileCount;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'PatientFolder(folderId: $folderId, userId: $userId, name: $name, fileCount: $fileCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientFolderImpl &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fileCount, fileCount) ||
                other.fileCount == fileCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, folderId, userId, name, fileCount, createdAt);

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
          {@JsonKey(name: 'id') required final int folderId,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'file_count') final int? fileCount,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$PatientFolderImpl;

  factory _PatientFolder.fromJson(Map<String, dynamic> json) =
      _$PatientFolderImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get folderId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'file_count')
  int? get fileCount;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of PatientFolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientFolderImplCopyWith<_$PatientFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
