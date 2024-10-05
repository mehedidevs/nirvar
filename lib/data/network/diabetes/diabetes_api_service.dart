
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/models/glucose_level/glucose_level.dart';
import 'package:nirvar/models/glucose_level_weekly/blood_glucose_weekly.dart';
import 'package:nirvar/models/patient_glucose/patient_glucose.dart';

import '../../../core/constants/constants.dart';
import '../../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';
import '../../../models/glucose_level_monthly/blood_glucose_monthly.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';

class DiabetesApiService {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;

  DiabetesApiService(this._dio, this._tokenStorage, this._userIdStorage) {
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

  Future<Either<ApiException,String>> storeDiabetes(double sugarLevel) async{
    try{
      final response = await _dio.post(
          patientDiabetes,
          data: {"blood_sugar_level" : sugarLevel}
      );
      if(response.statusCode ==200){
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1){
          String data = responseData['message'];
          return Right(data);
        }else{
          return Left(ApiException(responseData['message']));
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

  Future<Either<ApiException, String>> getBloodGlucoseOfToday() async {
    try {
      final response = await _dio.get(patientDiabetesToday);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1 && responseData['message'] == 'success') {
          final glucoseLevel = responseData['avg_level'];
          return Right(glucoseLevel);
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

  Future<Either<ApiException, GlucoseLevelForPastSevenDays>> getBloodGlucoseOfLast7Days() async {
    try {
      final response = await _dio.get(patientDiabetesLastSevenDays);

      print('GLUCOSE LEVEL 7 DaYS: $response');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        // Validate the structure of the response
        if (responseData['status'] == 1 && responseData['message'] == 'success' && responseData['data'] != null) {
          final glucoseData = GlucoseLevelForPastSevenDays.fromJson(responseData);
          return Right(glucoseData);
        } else {
          return Left(ApiException(responseData['message'] ?? 'Unknown error'));
        }
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e, stackTrace) {
      // Optionally log the error and stack trace
      return Left(ApiException(e.toString()));
    }
  }


  Future<Either<ApiException,BloodGlucoseWeekly>> getBloodGlucoseWeekly() async{
    try{
      final response = await _dio.get(patientDiabetesWeekly);

      if(response.statusCode == 200){
        final Map<String,dynamic> responseData = response.data;
        print("WEEKLY GLUCOSE : $responseData");
        if(responseData["status"]==1 && responseData["message"] == "success" && responseData["data"]!=null){
          final weeklyGlucoseLevel = BloodGlucoseWeekly.fromJson(responseData);
          return Right(weeklyGlucoseLevel);
        }else {
          return Left(ApiException(responseData['message'] ?? 'Unknown error'));
        }
      }else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e, stackTrace) {
      // Optionally log the error and stack trace
      return Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException,BloodGlucoseMonthly>> getBloodGlucoseMonthly() async{
    try{
      final response = await _dio.get(patientDiabetesMonthly);

      if(response.statusCode == 200){
        final Map<String,dynamic> responseData = response.data;
        print("Monthly GLUCOSE : $responseData");
        if(responseData["status"]==1 && responseData["message"] == "success" && responseData["data"]!=null){
          final monthlyGlucoseLevel = BloodGlucoseMonthly.fromJson(responseData);
          return Right(monthlyGlucoseLevel);
        }else {
          return Left(ApiException(responseData['message'] ?? 'Unknown error'));
        }
      }else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e, stackTrace) {
      // Optionally log the error and stack trace
      return Left(ApiException(e.toString()));
    }
  }

}