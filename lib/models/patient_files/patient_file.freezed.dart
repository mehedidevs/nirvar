// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientFile _$PatientFileFromJson(Map<String, dynamic> json) {
  return _PatientFile.fromJson(json);
}

/// @nodoc
mixin _$PatientFile {
  @JsonKey(name: 'id')
  int get fileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'folder_id')
  int get folderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'rename')
  String? get rename => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'folder_name')
  String? get folderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PatientFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientFileCopyWith<PatientFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientFileCopyWith<$Res> {
  factory $PatientFileCopyWith(
          PatientFile value, $Res Function(PatientFile) then) =
      _$PatientFileCopyWithImpl<$Res, PatientFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int fileId,
      @JsonKey(name: 'folder_id') int folderId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'rename') String? rename,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'folder_name') String? folderName,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$PatientFileCopyWithImpl<$Res, $Val extends PatientFile>
    implements $PatientFileCopyWith<$Res> {
  _$PatientFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? folderId = null,
    Object? name = freezed,
    Object? type = freezed,
    Object? rename = freezed,
    Object? path = freezed,
    Object? folderName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      rename: freezed == rename
          ? _value.rename
          : rename // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientFileImplCopyWith<$Res>
    implements $PatientFileCopyWith<$Res> {
  factory _$$PatientFileImplCopyWith(
          _$PatientFileImpl value, $Res Function(_$PatientFileImpl) then) =
      __$$PatientFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int fileId,
      @JsonKey(name: 'folder_id') int folderId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'rename') String? rename,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'folder_name') String? folderName,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$PatientFileImplCopyWithImpl<$Res>
    extends _$PatientFileCopyWithImpl<$Res, _$PatientFileImpl>
    implements _$$PatientFileImplCopyWith<$Res> {
  __$$PatientFileImplCopyWithImpl(
      _$PatientFileImpl _value, $Res Function(_$PatientFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? folderId = null,
    Object? name = freezed,
    Object? type = freezed,
    Object? rename = freezed,
    Object? path = freezed,
    Object? folderName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PatientFileImpl(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      rename: freezed == rename
          ? _value.rename
          : rename // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientFileImpl implements _PatientFile {
  const _$PatientFileImpl(
      {@JsonKey(name: 'id') required this.fileId,
      @JsonKey(name: 'folder_id') required this.folderId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'rename') this.rename,
      @JsonKey(name: 'path') this.path,
      @JsonKey(name: 'folder_name') this.folderName,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$PatientFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientFileImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int fileId;
  @override
  @JsonKey(name: 'folder_id')
  final int folderId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'rename')
  final String? rename;
  @override
  @JsonKey(name: 'path')
  final String? path;
  @override
  @JsonKey(name: 'folder_name')
  final String? folderName;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'PatientFile(fileId: $fileId, folderId: $folderId, name: $name, type: $type, rename: $rename, path: $path, folderName: $folderName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientFileImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rename, rename) || other.rename == rename) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileId, folderId, name, type,
      rename, path, folderName, createdAt);

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientFileImplCopyWith<_$PatientFileImpl> get copyWith =>
      __$$PatientFileImplCopyWithImpl<_$PatientFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientFileImplToJson(
      this,
    );
  }
}

abstract class _PatientFile implements PatientFile {
  const factory _PatientFile(
          {@JsonKey(name: 'id') required final int fileId,
          @JsonKey(name: 'folder_id') required final int folderId,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'rename') final String? rename,
          @JsonKey(name: 'path') final String? path,
          @JsonKey(name: 'folder_name') final String? folderName,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$PatientFileImpl;

  factory _PatientFile.fromJson(Map<String, dynamic> json) =
      _$PatientFileImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get fileId;
  @override
  @JsonKey(name: 'folder_id')
  int get folderId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'rename')
  String? get rename;
  @override
  @JsonKey(name: 'path')
  String? get path;
  @override
  @JsonKey(name: 'folder_name')
  String? get folderName;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientFileImplCopyWith<_$PatientFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
