// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_uploaded_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestUploadedFileImpl _$$LatestUploadedFileImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestUploadedFileImpl(
      folderId: (json['folder_id'] as num).toInt(),
      folderName: json['folder_name'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      rename: json['rename'] as String,
      type: json['type'] as String,
      path: json['path'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$LatestUploadedFileImplToJson(
        _$LatestUploadedFileImpl instance) =>
    <String, dynamic>{
      'folder_id': instance.folderId,
      'folder_name': instance.folderName,
      'id': instance.id,
      'name': instance.name,
      'rename': instance.rename,
      'type': instance.type,
      'path': instance.path,
      'created_at': instance.createdAt,
    };
