import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nirvar/core/constants/constants.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/core/resources/device_info.dart';

import '../../../injection_container.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';

class NotificationApiService {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;
  final _firebaseMessaging = sl<FirebaseMessaging>();

  NotificationApiService(this._dio,this._tokenStorage,this._userIdStorage,) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Accept'] = 'accept/json';
          if (options.extra['requiresAuth'] ?? true) {
            String? token = await _tokenStorage.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            } else {
              print(
                  'Warning: Trying to make an authenticated request without a token');
            }
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            print('Unauthorized: Token might be invalid or expired');
            _tokenStorage.clearToken();
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Either<ApiException, String>> sendDeviceCredentials() async {

    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');

    String deviceType = getDeviceType();

    String? fCMToken;
    try {
      fCMToken = await _firebaseMessaging.getToken();
    } catch (e) {
      return Left(ApiException('Failed to get FCM token: ${e.toString()}'));
    }
    if (fCMToken == null) {
      return Left(ApiException('FCM token is missing'));
    }

    print('FCM TOKEN OF USER: $fCMToken');

    var formData = FormData.fromMap({
      'user_id': userId,
      'device_token': fCMToken,
      'device_id': userId,
      'device_type': deviceType,
    });

    try {
      final response = await _dio.post(
        deviceInformation,
        options: Options(extra: {'requiresAuth': false},),
        data: formData,
      );
      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if(response.statusCode == 200){
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          final data = responseData['message'] ?? '';
          return Right(data);
        }else if (responseData['status'] == 0) {
          return Left(ApiException('There is any problem in the FCM Token'));
        } else {
          return Left(ApiException('Something Went Wrong'));
        }
      }else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
