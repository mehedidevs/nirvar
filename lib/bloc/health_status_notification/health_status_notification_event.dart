part of 'health_status_notification_bloc.dart';


sealed class HealthStatusNotificationEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetNotificationFromApi extends HealthStatusNotificationEvent{}