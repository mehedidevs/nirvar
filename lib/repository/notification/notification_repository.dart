
import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';


abstract class NotificationRepository{
  Future<Either<ApiException, String>> sendDeviceCredentials();
  Future<Either<ApiException,String>> showNotification();
  Future<Either<ApiException,String>> showNotificationDetails(int notificationId);
}