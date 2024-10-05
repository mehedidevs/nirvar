// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glucose_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlucoseLevelImpl _$$GlucoseLevelImplFromJson(Map<String, dynamic> json) =>
    _$GlucoseLevelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      minimum: json['minimum'] as String?,
      maximum: json['maximum'] as String?,
    );

Map<String, dynamic> _$$GlucoseLevelImplToJson(_$GlucoseLevelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };
