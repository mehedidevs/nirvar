
import 'package:dartz/dartz.dart';
import 'package:nirvar/models/health_notification/health_notification.dart';
import '../../core/resources/api_exception.dart';


abstract class NotificationRepository{
  Future<Either<ApiException, String>> sendDeviceCredentials();
  Future<Either<ApiException,List<HealthNotification>>> showNotification();
  Future<Either<ApiException,String>> showNotificationDetails(int notificationId);
}