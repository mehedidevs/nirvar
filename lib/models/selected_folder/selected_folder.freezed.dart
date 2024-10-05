// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectedFolder _$SelectedFolderFromJson(Map<String, dynamic> json) {
  return _SelectedFolder.fromJson(json);
}

/// @nodoc
mixin _$SelectedFolder {
  @JsonKey(name: 'id')
  int? get id =>
      throw _privateConstructorUsedError; // Optional and mapped to 'id' in the JSON
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this SelectedFolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedFolderCopyWith<SelectedFolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedFolderCopyWith<$Res> {
  factory $SelectedFolderCopyWith(
          SelectedFolder value, $Res Function(SelectedFolder) then) =
      _$SelectedFolderCopyWithImpl<$Res, SelectedFolder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$SelectedFolderCopyWithImpl<$Res, $Val extends SelectedFolder>
    implements $SelectedFolderCopyWith<$Res> {
  _$SelectedFolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedFolderImplCopyWith<$Res>
    implements $SelectedFolderCopyWith<$Res> {
  factory _$$SelectedFolderImplCopyWith(_$SelectedFolderImpl value,
          $Res Function(_$SelectedFolderImpl) then) =
      __$$SelectedFolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$SelectedFolderImplCopyWithImpl<$Res>
    extends _$SelectedFolderCopyWithImpl<$Res, _$SelectedFolderImpl>
    implements _$$SelectedFolderImplCopyWith<$Res> {
  __$$SelectedFolderImplCopyWithImpl(
      _$SelectedFolderImpl _value, $Res Function(_$SelectedFolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$SelectedFolderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedFolderImpl implements _SelectedFolder {
  const _$SelectedFolderImpl(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name});

  factory _$SelectedFolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedFolderImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
// Optional and mapped to 'id' in the JSON
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'SelectedFolder(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedFolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of SelectedFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedFolderImplCopyWith<_$SelectedFolderImpl> get copyWith =>
      __$$SelectedFolderImplCopyWithImpl<_$SelectedFolderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedFolderImplToJson(
      this,
    );
  }
}

abstract class _SelectedFolder implements SelectedFolder {
  const factory _SelectedFolder(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name}) = _$SelectedFolderImpl;

  factory _SelectedFolder.fromJson(Map<String, dynamic> json) =
      _$SelectedFolderImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id; // Optional and mapped to 'id' in the JSON
  @override
  @JsonKey(name: 'name')
  String? get name;

  /// Create a copy of SelectedFolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedFolderImplCopyWith<_$SelectedFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
