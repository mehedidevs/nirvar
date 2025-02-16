import 'dart:math';
import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor{

  final Dio dio;

  CustomInterceptor({required this.dio});

  final int maxRetries = 3;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Retry conditions: Only retry if it's a network issue or timeout
    if (_shouldRetry(err) && err.requestOptions.extra['retries'] == null) {
      err.requestOptions.extra['retries'] = 0;  // Initialize retry count if not present
    }

    if (_shouldRetry(err)) {
      final retries = err.requestOptions.extra['retries'] as int;
      if (retries < maxRetries) {
        // Apply exponential backoff delay: 2^retries seconds
        final retryDelay = Duration(seconds: pow(2, retries).toInt());
        await Future.delayed(retryDelay);

        // Increment retry counter
        err.requestOptions.extra['retries'] = retries + 1;

        try {
          // Retry the request with the updated options
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          // If the retry attempt fails, pass the error back
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            type: DioExceptionType.unknown,
            error: 'Retry error: ${e.toString()}',
          ));
        }
      }
    }

    // Pass any other errors that are not retryable or exhausted retries
    return handler.next(err);
  }

  // Determines whether the error is retry able
  bool _shouldRetry(DioException err) {
    // Retry for network issues, timeouts, and server errors (5xx)
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }

}

