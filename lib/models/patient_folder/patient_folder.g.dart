// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientFolderImpl _$$PatientFolderImplFromJson(Map<String, dynamic> json) =>
    _$PatientFolderImpl(
      folderId: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fileCount: (json['file_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$PatientFolderImplToJson(_$PatientFolderImpl instance) =>
    <String, dynamic>{
      'id': instance.folderId,
      'user_id': instance.userId,
      'name': instance.name,
      'file_count': instance.fileCount,
      'created_at': instance.createdAt,
    };
