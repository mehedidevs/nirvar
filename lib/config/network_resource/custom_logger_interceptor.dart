import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CustomLoggerInterceptor extends Interceptor {
  final PrettyDioLogger _prettyDioLogger;

  CustomLoggerInterceptor()
      : _prettyDioLogger = PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
          maxWidth: 90,
        );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _prettyDioLogger.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _prettyDioLogger.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _prettyDioLogger.onError(err, handler);
  }
}
