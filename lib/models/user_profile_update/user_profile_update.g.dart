// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileUpdateImpl _$$UserProfileUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileUpdateImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      bloodGroup: json['blood_group'] as String?,
      weight: json['weight'] as String?,
      heightFt: json['height_ft'] as String?,
      heightIn: json['height_in'] as String?,
      address: json['address'] as String?,
      photo: _multipartFileFromJson(json['photo']),
    );

Map<String, dynamic> _$$UserProfileUpdateImplToJson(
        _$UserProfileUpdateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'blood_group': instance.bloodGroup,
      'weight': instance.weight,
      'height_ft': instance.heightFt,
      'height_in': instance.heightIn,
      'address': instance.address,
      'photo': _multipartFileToJson(instance.photo),
    };
