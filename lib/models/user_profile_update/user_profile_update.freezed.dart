// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileUpdate _$UserProfileUpdateFromJson(Map<String, dynamic> json) {
  return _UserProfileUpdate.fromJson(json);
}

/// @nodoc
mixin _$UserProfileUpdate {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_ft')
  String? get heightFt => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_in')
  String? get heightIn => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
  MultipartFile? get photo => throw _privateConstructorUsedError;

  /// Serializes this UserProfileUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileUpdateCopyWith<UserProfileUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileUpdateCopyWith<$Res> {
  factory $UserProfileUpdateCopyWith(
          UserProfileUpdate value, $Res Function(UserProfileUpdate) then) =
      _$UserProfileUpdateCopyWithImpl<$Res, UserProfileUpdate>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? gender,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      String? weight,
      @JsonKey(name: 'height_ft') String? heightFt,
      @JsonKey(name: 'height_in') String? heightIn,
      String? address,
      @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
      MultipartFile? photo});
}

/// @nodoc
class _$UserProfileUpdateCopyWithImpl<$Res, $Val extends UserProfileUpdate>
    implements $UserProfileUpdateCopyWith<$Res> {
  _$UserProfileUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? bloodGroup = freezed,
    Object? weight = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? address = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _value.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      heightFt: freezed == heightFt
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as String?,
      heightIn: freezed == heightIn
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileUpdateImplCopyWith<$Res>
    implements $UserProfileUpdateCopyWith<$Res> {
  factory _$$UserProfileUpdateImplCopyWith(_$UserProfileUpdateImpl value,
          $Res Function(_$UserProfileUpdateImpl) then) =
      __$$UserProfileUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? gender,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      String? weight,
      @JsonKey(name: 'height_ft') String? heightFt,
      @JsonKey(name: 'height_in') String? heightIn,
      String? address,
      @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
      MultipartFile? photo});
}

/// @nodoc
class __$$UserProfileUpdateImplCopyWithImpl<$Res>
    extends _$UserProfileUpdateCopyWithImpl<$Res, _$UserProfileUpdateImpl>
    implements _$$UserProfileUpdateImplCopyWith<$Res> {
  __$$UserProfileUpdateImplCopyWithImpl(_$UserProfileUpdateImpl _value,
      $Res Function(_$UserProfileUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? bloodGroup = freezed,
    Object? weight = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? address = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$UserProfileUpdateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _value.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      heightFt: freezed == heightFt
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as String?,
      heightIn: freezed == heightIn
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileUpdateImpl implements _UserProfileUpdate {
  const _$UserProfileUpdateImpl(
      {this.name,
      this.email,
      this.gender,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      @JsonKey(name: 'blood_group') this.bloodGroup,
      this.weight,
      @JsonKey(name: 'height_ft') this.heightFt,
      @JsonKey(name: 'height_in') this.heightIn,
      this.address,
      @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
      this.photo});

  factory _$UserProfileUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileUpdateImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  final String? weight;
  @override
  @JsonKey(name: 'height_ft')
  final String? heightFt;
  @override
  @JsonKey(name: 'height_in')
  final String? heightIn;
  @override
  final String? address;
  @override
  @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
  final MultipartFile? photo;

  @override
  String toString() {
    return 'UserProfileUpdate(name: $name, email: $email, gender: $gender, dateOfBirth: $dateOfBirth, bloodGroup: $bloodGroup, weight: $weight, heightFt: $heightFt, heightIn: $heightIn, address: $address, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileUpdateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.heightFt, heightFt) ||
                other.heightFt == heightFt) &&
            (identical(other.heightIn, heightIn) ||
                other.heightIn == heightIn) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, gender, dateOfBirth,
      bloodGroup, weight, heightFt, heightIn, address, photo);

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileUpdateImplCopyWith<_$UserProfileUpdateImpl> get copyWith =>
      __$$UserProfileUpdateImplCopyWithImpl<_$UserProfileUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileUpdateImplToJson(
      this,
    );
  }
}

abstract class _UserProfileUpdate implements UserProfileUpdate {
  const factory _UserProfileUpdate(
      {final String? name,
      final String? email,
      final String? gender,
      @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
      @JsonKey(name: 'blood_group') final String? bloodGroup,
      final String? weight,
      @JsonKey(name: 'height_ft') final String? heightFt,
      @JsonKey(name: 'height_in') final String? heightIn,
      final String? address,
      @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
      final MultipartFile? photo}) = _$UserProfileUpdateImpl;

  factory _UserProfileUpdate.fromJson(Map<String, dynamic> json) =
      _$UserProfileUpdateImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @override
  String? get weight;
  @override
  @JsonKey(name: 'height_ft')
  String? get heightFt;
  @override
  @JsonKey(name: 'height_in')
  String? get heightIn;
  @override
  String? get address;
  @override
  @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson)
  MultipartFile? get photo;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileUpdateImplCopyWith<_$UserProfileUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
