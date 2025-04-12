import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../injection_container.dart';
import 'api_exceptions.dart';
import 'custom_error_interceptor.dart';
import 'custom_logger_interceptor.dart';


enum Method { POST, GET, PUT, DELETE, PATCH }

class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio {
    _dio.interceptors.addAll([
      sl<CustomErrorInterceptor>(),
      CustomLoggerInterceptor()
    ]);
  }

  Future<Either<ApiException, Response>> request({
    required String endPoints,
    required Method method,
    Map<String, dynamic>? additionalHeaders,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Options options = Options(headers: additionalHeaders);

      Response response = await _performRequest(
        url: endPoints,
        method: method,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(response);
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  Future<Response> _performRequest({
    required String url,
    required Method method,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    switch (method) {
      case Method.GET:
        return _dio.get(url, queryParameters: queryParameters, options: options);
      case Method.POST:
        return _dio.post(url, data: data, options: options);
      case Method.PUT:
        return _dio.put(url, data: data, options: options);
      case Method.DELETE:
        return _dio.delete(url, data: data, options: options);
      case Method.PATCH:
        return _dio.patch(url, data: data, options: options);
    }
  }
}
