// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_blood_pressure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientBloodPressureImpl _$$PatientBloodPressureImplFromJson(
        Map<String, dynamic> json) =>
    _$PatientBloodPressureImpl(
      bpId: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      systolic: (json['systolic'] as num?)?.toInt(),
      diastolic: (json['diastolic'] as num?)?.toInt(),
      category: json['category'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PatientBloodPressureImplToJson(
        _$PatientBloodPressureImpl instance) =>
    <String, dynamic>{
      'id': instance.bpId,
      'user_id': instance.userId,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'category': instance.category,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
