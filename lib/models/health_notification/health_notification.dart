import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_notification.freezed.dart';
part 'health_notification.g.dart';

@freezed
class HealthNotification with _$HealthNotification {
  const factory HealthNotification({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'notifiable_type') String? notifiableType,
    @JsonKey(name: 'notifiable_id') int? notifiableId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'data') String? data,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _HealthNotification;

  factory HealthNotification.fromJson(Map<String, dynamic> json) =>
      _$HealthNotificationFromJson(json);
}