// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCredentialsImpl _$$UserCredentialsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCredentialsImpl(
      userId: (json['userId'] as num).toInt(),
      photo: json['photo'] as String?,
      name: json['name'] as String,
      email: json['email'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      bloodGroup: json['bloodGroup'] as String,
      weight: json['weight'] as String?,
      heightFt: json['heightFt'] as String?,
      heightIn: json['heightIn'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$UserCredentialsImplToJson(
        _$UserCredentialsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'photo': instance.photo,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'bloodGroup': instance.bloodGroup,
      'weight': instance.weight,
      'heightFt': instance.heightFt,
      'heightIn': instance.heightIn,
      'address': instance.address,
    };
