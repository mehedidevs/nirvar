import 'package:dio/dio.dart';
import '../../config/network_resource/logger.dart';
import '../../main.dart';
import '../../routes/routes_name.dart';
import '../preference/token_storage.dart';
import '../preference/user_id_storage.dart';



class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;


  AuthInterceptor({
    required TokenStorage tokenStorage,
    required UserIdStorage userIdStorage,
  })  : _tokenStorage = tokenStorage,
        _userIdStorage = userIdStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'accept/json';

    // Attach token if authentication is required
    if (options.extra['requiresAuth'] ?? true) {
      final token = await _tokenStorage.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        logger.e('[Interceptor] Warning: Auth request attempted without token');
      }
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    if (statusCode == 401) {
      logger.e('[Interceptor] 401 Unauthorized: Token expired or invalid');

      // Clear sensitive data
      await _tokenStorage.clearToken();
      await _userIdStorage.clearUserID();

      // Navigate to login screen
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        RoutesName.signInScreen,
        (route) => false,
      );
    }

    return handler.next(err); // Forward error
  }
}
