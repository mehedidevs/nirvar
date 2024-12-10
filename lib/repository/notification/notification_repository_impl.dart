
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/notification/notification_api_service.dart';
import 'package:nirvar/repository/notification/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository{

  final NotificationApiService _apiService;

  NotificationRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiException, String>> sendDeviceCredentials() {
   return _apiService.sendDeviceCredentials();
  }

  @override
  Future<Either<ApiException, String>> showNotification() {
    return _apiService.showNotification();
  }

  @override
  Future<Either<ApiException, String>> showNotificationDetails(int notificationId) {
   return _apiService.showNotificationDetails(notificationId);
  }

}