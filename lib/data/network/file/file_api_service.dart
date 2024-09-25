import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';

import '../../../core/constants/constants.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';


// //Files
// const String patientFiles = '/patient/files/1'; // //need to Id
// const String patientFileUpload = '/patient/file/upload';
// const String patientFileDelete = '/patient/file/delete/3';

class FileApiService{
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;

  FileApiService(this._dio, this._tokenStorage, this._userIdStorage) {
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


  Stream<Either<ApiException,List<PatientFile>>> getAllPrescriptions(int folderID)async*{
    try{
      final response = await _dio.get('$patientFiles$folderID');
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if(response.statusCode == 200){
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1 && responseData['message'] == 'success') {
          final List<dynamic> prescriptionsJson = responseData['data']['prescription'] ?? [];

          if (prescriptionsJson.isNotEmpty) {
            final List<PatientFile> prescriptions = prescriptionsJson
                .map((fileJson) => PatientFile.fromJson(fileJson as Map<String, dynamic>))
                .toList();

            yield Right(prescriptions);
          } else {
            yield Left(ApiException('No prescriptions found.'));
          }
        }else {
          yield Left(ApiException(responseData['message']));
        }
      }else {
        yield Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    }on DioException catch (e) {
    yield Left(ApiException.fromDioError(e));
    } catch (e) {
    yield Left(ApiException(e.toString()));
    }
  }

  Stream<Either<ApiException,List<PatientFile>>> getAllTestReports(int folderID)async*{
    try{
      final response = await _dio.get('$patientFiles$folderID');
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if(response.statusCode == 200){
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1 && responseData['message'] == 'success') {
          final List<dynamic> prescriptionsJson = responseData['data']['test_report'] ?? [];

          if (prescriptionsJson.isNotEmpty) {
            final List<PatientFile> prescriptions = prescriptionsJson
                .map((fileJson) => PatientFile.fromJson(fileJson as Map<String, dynamic>))
                .toList();

            yield Right(prescriptions);
          } else {
            yield Left(ApiException('No prescriptions found.'));
          }
        }else {
          yield Left(ApiException(responseData['message']));
        }
      }else {
        yield Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    }on DioException catch (e) {
      yield Left(ApiException.fromDioError(e));
    } catch (e) {
      yield Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException,String>> deleteFile(int fileId) async{
    try{
      final response = await _dio.get('$patientFileDelete$fileId');
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

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






}