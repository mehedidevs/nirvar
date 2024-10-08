// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_folder_for_prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatedFolderForPrescriptionImpl _$$CreatedFolderForPrescriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatedFolderForPrescriptionImpl(
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreatedFolderForPrescriptionImplToJson(
        _$CreatedFolderForPrescriptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'user_id': instance.userId,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
