// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientFileImpl _$$PatientFileImplFromJson(Map<String, dynamic> json) =>
    _$PatientFileImpl(
      id: (json['id'] as num).toInt(),
      folderId: (json['folderId'] as num).toInt(),
      folderName: json['folderName'] as String?,
      name: json['name'] as String?,
      rename: json['rename'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$PatientFileImplToJson(_$PatientFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'folderId': instance.folderId,
      'folderName': instance.folderName,
      'name': instance.name,
      'rename': instance.rename,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'photo': instance.photo,
    };
