// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthNotificationImpl _$$HealthNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthNotificationImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: (json['notifiable_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      data: json['data'] as String?,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$HealthNotificationImplToJson(
        _$HealthNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'title': instance.title,
      'data': instance.data,
      'read_at': instance.readAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
