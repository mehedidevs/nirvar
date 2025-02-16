// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthNotification _$HealthNotificationFromJson(Map<String, dynamic> json) {
  return _HealthNotification.fromJson(json);
}

/// @nodoc
mixin _$HealthNotification {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifiable_type')
  String? get notifiableType => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifiable_id')
  int? get notifiableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  String? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  String? get readAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HealthNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthNotificationCopyWith<HealthNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthNotificationCopyWith<$Res> {
  factory $HealthNotificationCopyWith(
          HealthNotification value, $Res Function(HealthNotification) then) =
      _$HealthNotificationCopyWithImpl<$Res, HealthNotification>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'notifiable_type') String? notifiableType,
      @JsonKey(name: 'notifiable_id') int? notifiableId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'data') String? data,
      @JsonKey(name: 'read_at') String? readAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$HealthNotificationCopyWithImpl<$Res, $Val extends HealthNotification>
    implements $HealthNotificationCopyWith<$Res> {
  _$HealthNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? title = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthNotificationImplCopyWith<$Res>
    implements $HealthNotificationCopyWith<$Res> {
  factory _$$HealthNotificationImplCopyWith(_$HealthNotificationImpl value,
          $Res Function(_$HealthNotificationImpl) then) =
      __$$HealthNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'notifiable_type') String? notifiableType,
      @JsonKey(name: 'notifiable_id') int? notifiableId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'data') String? data,
      @JsonKey(name: 'read_at') String? readAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$HealthNotificationImplCopyWithImpl<$Res>
    extends _$HealthNotificationCopyWithImpl<$Res, _$HealthNotificationImpl>
    implements _$$HealthNotificationImplCopyWith<$Res> {
  __$$HealthNotificationImplCopyWithImpl(_$HealthNotificationImpl _value,
      $Res Function(_$HealthNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? title = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$HealthNotificationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthNotificationImpl implements _HealthNotification {
  const _$HealthNotificationImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'notifiable_type') this.notifiableType,
      @JsonKey(name: 'notifiable_id') this.notifiableId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'read_at') this.readAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$HealthNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthNotificationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'notifiable_type')
  final String? notifiableType;
  @override
  @JsonKey(name: 'notifiable_id')
  final int? notifiableId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'data')
  final String? data;
  @override
  @JsonKey(name: 'read_at')
  final String? readAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'HealthNotification(id: $id, type: $type, notifiableType: $notifiableType, notifiableId: $notifiableId, title: $title, data: $data, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notifiableType, notifiableType) ||
                other.notifiableType == notifiableType) &&
            (identical(other.notifiableId, notifiableId) ||
                other.notifiableId == notifiableId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, notifiableType,
      notifiableId, title, data, readAt, createdAt, updatedAt);

  /// Create a copy of HealthNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthNotificationImplCopyWith<_$HealthNotificationImpl> get copyWith =>
      __$$HealthNotificationImplCopyWithImpl<_$HealthNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthNotificationImplToJson(
      this,
    );
  }
}

abstract class _HealthNotification implements HealthNotification {
  const factory _HealthNotification(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'notifiable_type') final String? notifiableType,
          @JsonKey(name: 'notifiable_id') final int? notifiableId,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'data') final String? data,
          @JsonKey(name: 'read_at') final String? readAt,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$HealthNotificationImpl;

  factory _HealthNotification.fromJson(Map<String, dynamic> json) =
      _$HealthNotificationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'notifiable_type')
  String? get notifiableType;
  @override
  @JsonKey(name: 'notifiable_id')
  int? get notifiableId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'data')
  String? get data;
  @override
  @JsonKey(name: 'read_at')
  String? get readAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of HealthNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthNotificationImplCopyWith<_$HealthNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
