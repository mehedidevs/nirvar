part of 'health_status_notification_bloc.dart';


enum NotificationStatus { initial, loading, success, failure }

final class HealthStatusNotificationState extends Equatable {
  final NotificationStatus status;
  final List<HealthNotification> notificationList;
  final String errorMessage;

  const HealthStatusNotificationState({
    this.status = NotificationStatus.initial,
    this.notificationList = const [],
    this.errorMessage = '',
  });

  HealthStatusNotificationState copyWith({
    NotificationStatus? status,
    List<HealthNotification>? notificationList,
    String? errorMessage,
  }){
    return HealthStatusNotificationState(
        status: status ?? this.status,
        notificationList: notificationList ?? this.notificationList,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,notificationList,errorMessage];
}