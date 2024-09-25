// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientFileImpl _$$PatientFileImplFromJson(Map<String, dynamic> json) =>
    _$PatientFileImpl(
      fileId: (json['id'] as num).toInt(),
      folderId: (json['folder_id'] as num).toInt(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      rename: json['rename'] as String?,
      path: json['path'] as String?,
      folderName: json['folder_name'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$PatientFileImplToJson(_$PatientFileImpl instance) =>
    <String, dynamic>{
      'id': instance.fileId,
      'folder_id': instance.folderId,
      'name': instance.name,
      'type': instance.type,
      'rename': instance.rename,
      'path': instance.path,
      'folder_name': instance.folderName,
      'created_at': instance.createdAt,
    };
