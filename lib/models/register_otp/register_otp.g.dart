// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterOtpImpl _$$RegisterOtpImplFromJson(Map<String, dynamic> json) =>
    _$RegisterOtpImpl(
      number: json['number'] as String?,
      role: json['role'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$RegisterOtpImplToJson(_$RegisterOtpImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'role': instance.role,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
    };
