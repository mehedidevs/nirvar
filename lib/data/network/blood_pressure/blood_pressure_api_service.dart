
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/models/patient_blood_pressure/patient_blood_pressure.dart';

import '../../../core/constants/constants.dart';
import '../../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';
import '../../../models/blood_pressure_monthly/blood_pressure_summary_monthly.dart';
import '../../../models/blood_pressure_weekly/blood_pressure_summary_weekly.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';

class BloodPressureApiService {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;

  BloodPressureApiService(this._dio, this._tokenStorage, this._userIdStorage) {
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

  Future<Either<ApiException,String>> storeBloodPressure(int systolic,int diastolic) async{
    try{
      final response = await _dio.post(
          patientBloodPressure,
        data: {
            "systolic" : systolic,
            "diastolic" : diastolic,
        }
      );
      if(response.statusCode ==200){
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1){
          String data = responseData['message'];
          return Right(data);
        }else{
          return Left(ApiException(responseData['error']));
        }
      }else{
        return Left(ApiException('Something Went Wrong'));
      }
    }on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException, List<PatientBloodPressure>>> getBloodPressureOfToday() async {
    try {
      final response = await _dio.get(patientBloodPressureToday);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 1 && responseData['message'] == 'success') {
          final List<dynamic> bloodPressureJson = responseData['data'] ?? [];

          if (bloodPressureJson.isNotEmpty) {
            final List<PatientBloodPressure> bloodPressureList = bloodPressureJson
                .map((json) => PatientBloodPressure.fromJson(json as Map<String, dynamic>))
                .toList();

            return Right(bloodPressureList);
          } else {
            return Left(ApiException('No blood pressure data found.'));
          }
        } else {
          return Left(ApiException(responseData['message']));
        }
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  //NEED TO MAKE IT FUTURE
  Future<Either<ApiException, BloodPressureHistoryForLast7Days>> getBloodPressureOfLast7Days() async {
    try {
      final response = await _dio.get(patientBloodPressureLastSevenDays);

      // Handle the HTTP response
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        print("RESPONSE: $responseData");

        // Ensure both 'status' and 'message' exist in the response before proceeding
        if (responseData['status'] == 1 && responseData['message'] == 'success') {

          // Deserialize the response data into the Freezed model
          final bloodPressureData = BloodPressureHistoryForLast7Days.fromJson(responseData);

          // Yield the success case
          return Right(bloodPressureData);
        } else {
          // Handle API-specific errors (non-successful status or invalid message)
          final errorMessage = responseData['message'] ?? 'Unknown error';
          return Left(ApiException(errorMessage));
        }
      } else {
        // Handle HTTP errors (non-200 status codes)
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (dioError) {
      // Handle Dio-specific exceptions (like timeouts, connection issues, etc.)
      return Left(ApiException.fromDioError(dioError));
    } catch (e) {
      // Catch any other unexpected errors and convert them to ApiException
      return Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException,BloodPressureSummaryWeekly>> getBloodPressureWeekly() async{
    try{
      final response = await _dio.get(patientBloodPressureWeekly);

      // Handle the HTTP response
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        print("RESPONSE: $responseData");

        // Ensure both 'status' and 'message' exist in the response before proceeding
        if (responseData['status'] == 1 && responseData['message'] == 'success') {

          // Deserialize the response data into the Freezed model
          final bloodPressureData = BloodPressureSummaryWeekly.fromJson(responseData);

          // Yield the success case
          return Right(bloodPressureData);
        } else {
          // Handle API-specific errors (non-successful status or invalid message)
          final errorMessage = responseData['message'] ?? 'Unknown error';
          return Left(ApiException(errorMessage));
        }
      } else {
        // Handle HTTP errors (non-200 status codes)
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }


    }on DioException catch (dioError) {
      // Handle Dio-specific exceptions (like timeouts, connection issues, etc.)
      return Left(ApiException.fromDioError(dioError));
    } catch (e) {
      // Catch any other unexpected errors and convert them to ApiException
      return Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException,BloodPressureSummaryMonthly>> getBloodPressureMonthly() async{
    try{
      final response = await _dio.get(patientBloodPressureMonthly);

      // Handle the HTTP response
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        print("RESPONSE: $responseData");

        // Ensure both 'status' and 'message' exist in the response before proceeding
        if (responseData['status'] == 1 && responseData['message'] == 'success') {

          // Deserialize the response data into the Freezed model
          final bloodPressureData = BloodPressureSummaryMonthly.fromJson(responseData);

          // Yield the success case
          return Right(bloodPressureData);
        } else {
          // Handle API-specific errors (non-successful status or invalid message)
          final errorMessage = responseData['message'] ?? 'Unknown error';
          return Left(ApiException(errorMessage));
        }
      } else {
        // Handle HTTP errors (non-200 status codes)
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }


    }on DioException catch (dioError) {
      // Handle Dio-specific exceptions (like timeouts, connection issues, etc.)
      return Left(ApiException.fromDioError(dioError));
    } catch (e) {
      // Catch any other unexpected errors and convert them to ApiException
      return Left(ApiException(e.toString()));
    }
  }

}