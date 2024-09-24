// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientFolderImpl _$$PatientFolderImplFromJson(Map<String, dynamic> json) =>
    _$PatientFolderImpl(
      name: json['name'] as String,
      userId: (json['user_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      fileCount: (json['fileCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PatientFolderImplToJson(_$PatientFolderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'user_id': instance.userId,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'fileCount': instance.fileCount,
    };
