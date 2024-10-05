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
      bloodGroup: json['blood_gorup'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'number': instance.number,
      'photo': instance.photo,
      'blood_gorup': instance.bloodGroup,
      'date_of_birth': instance.dateOfBirth,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'gender': instance.gender,
      'address': instance.address,
    };
