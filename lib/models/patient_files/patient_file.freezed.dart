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
  int get id => throw _privateConstructorUsedError;
  int get folderId => throw _privateConstructorUsedError;
  String? get folderName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get rename => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

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
      {int id,
      int folderId,
      String? folderName,
      String? name,
      String? rename,
      String? type,
      String? createdAt,
      String? photo});
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
    Object? id = null,
    Object? folderId = null,
    Object? folderName = freezed,
    Object? name = freezed,
    Object? rename = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rename: freezed == rename
          ? _value.rename
          : rename // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
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
      {int id,
      int folderId,
      String? folderName,
      String? name,
      String? rename,
      String? type,
      String? createdAt,
      String? photo});
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
    Object? id = null,
    Object? folderId = null,
    Object? folderName = freezed,
    Object? name = freezed,
    Object? rename = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$PatientFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rename: freezed == rename
          ? _value.rename
          : rename // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientFileImpl implements _PatientFile {
  const _$PatientFileImpl(
      {required this.id,
      required this.folderId,
      this.folderName,
      this.name,
      this.rename,
      this.type,
      this.createdAt,
      this.photo});

  factory _$PatientFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientFileImplFromJson(json);

  @override
  final int id;
  @override
  final int folderId;
  @override
  final String? folderName;
  @override
  final String? name;
  @override
  final String? rename;
  @override
  final String? type;
  @override
  final String? createdAt;
  @override
  final String? photo;

  @override
  String toString() {
    return 'PatientFile(id: $id, folderId: $folderId, folderName: $folderName, name: $name, rename: $rename, type: $type, createdAt: $createdAt, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rename, rename) || other.rename == rename) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, folderId, folderName, name,
      rename, type, createdAt, photo);

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
      {required final int id,
      required final int folderId,
      final String? folderName,
      final String? name,
      final String? rename,
      final String? type,
      final String? createdAt,
      final String? photo}) = _$PatientFileImpl;

  factory _PatientFile.fromJson(Map<String, dynamic> json) =
      _$PatientFileImpl.fromJson;

  @override
  int get id;
  @override
  int get folderId;
  @override
  String? get folderName;
  @override
  String? get name;
  @override
  String? get rename;
  @override
  String? get type;
  @override
  String? get createdAt;
  @override
  String? get photo;

  /// Create a copy of PatientFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientFileImplCopyWith<_$PatientFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
