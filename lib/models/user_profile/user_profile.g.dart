// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      number: json['number'] as String?,
      photo: json['photo'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'number': instance.number,
      'photo': instance.photo,
      'bloodGroup': instance.bloodGroup,
      'dateOfBirth': instance.dateOfBirth,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'gender': instance.gender,
      'address': instance.address,
    };
