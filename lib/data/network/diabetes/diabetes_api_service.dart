
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/models/patient_glucose/patient_glucose.dart';

import '../../../core/constants/constants.dart';
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

  Future<Either<ApiException,String>> storeDiabetes(int sugarLevel) async{
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

  Stream<Either<ApiException,List<PatientGlucose>>> getBloodGlucoseOfLast7Days() async*{
    try {
      final response = await _dio.get(patientDiabetesLastSevenDays);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 1 && responseData['message'] == 'success') {
          final List<dynamic> bloodGlucoseJson = responseData['data'] ?? [];

          if (bloodGlucoseJson.isNotEmpty) {
            final List<PatientGlucose> bloodGlucoseList = bloodGlucoseJson
                .map((json) => PatientGlucose.fromJson(json as Map<String, dynamic>))
                .toList();

            yield Right(bloodGlucoseList);
          } else {
            yield Left(ApiException('No blood pressure data found.'));
          }
        } else {
          yield Left(ApiException(responseData['message']));
        }
      } else {
        yield Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      yield Left(ApiException.fromDioError(e));
    } catch (e) {
      yield Left(ApiException(e.toString()));
    }
  }


























}