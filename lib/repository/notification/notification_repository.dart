
import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';


abstract class NotificationRepository{
  Future<Either<ApiException, String>> sendDeviceCredentials();
}