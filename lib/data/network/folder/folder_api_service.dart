import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/models/selected_folder/selected_folder.dart';

import '../../../core/constants/constants.dart';
import '../../../models/created_folder_for_prescription/created_folder_for_prescription.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';

class FolderApiService {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;

  FolderApiService(this._dio, this._tokenStorage, this._userIdStorage) {
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

  Stream<Either<ApiException, List<PatientFolder>>> getAllFolders() async* {
    try {
      final response = await _dio.get(patientFolders);
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          final List<PatientFolder> folders = (responseData['data'] as List)
              .map((folderJson) => PatientFolder.fromJson(folderJson))
              .toList();
          yield Right(folders);
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

  Future<Either<ApiException, String>> createFolder(String folderName) async {
    try {
      final response = await _dio.post(
        patientFolderCreate,
        data: {"name": folderName},
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.data);
        if (responseData['status'] == 1) {
          PatientFolder folder = PatientFolder.fromJson(responseData['data']);
          print('Created Folder: $folder');
          return Right(responseData['message']);
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

  Future<Either<ApiException, String>> updateFolder(int folderId, String folderName) async {
    try {
      final response = await _dio.post(
        patientFolderUpdate,
        data: {
          "folder_id": folderId,
          "name": folderName,
        },
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          PatientFolder folder = PatientFolder.fromJson(responseData['data']);
          print('Created Folder: $folder');
          return Right(responseData['message']);
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

  Future<Either<ApiException, String>> deleteFolder(int folderId) async {
    try {
      final response = await _dio.get(
        '$patientFolderDelete$folderId',
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          return Right(responseData['message']);
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

  Future<Either<ApiException,String>> shareFolder(int folderId) async{
    try {
      final response = await _dio.get(
        '/patient/folders/$folderId/share',
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String url = responseData['url'];
          return Right(url);
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


  //OCR Related End Points
  Future<Either<ApiException,List<SelectedFolder>>> selectFolder() async{
    try{
      final response = await _dio.get(patientFolderSelected);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          final List<SelectedFolder> selectedFolders = (responseData['data'] as List)
              .map((folderJson) => SelectedFolder.fromJson(folderJson))
              .toList();
          return Right(selectedFolders);
        } else {
          return Left(ApiException(responseData['message']));
        }
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    }on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  Future<Either<ApiException, CreatedFolderForPrescription>> createFolderForPrescription(String folderName) async {
    try {
      final response = await _dio.post(
        patientFolderCreate,
        data: {"name": folderName},
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          final folder = CreatedFolderForPrescription.fromJson(responseData['data']);
          print('Created Folder: $folder');
          return Right(folder);
        } else {
          return Left(ApiException(responseData['message'] ?? 'Unknown Problem'));
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

  Future<Either<ApiException,List<String>>> doctorSpeciality() async{
    try{
      final response = await _dio.get(doctorSpecialities);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1 && responseData["message"] == "success") {
          final List<dynamic> data = responseData['data'] ?? [];
          final List<String> speciality = data.whereType<String>().map((e) => e.toLowerCase()).toList();
          print(speciality.toString());
          return Right(speciality);
        } else {
          return Left(ApiException(responseData['message'] ?? 'Unknown Problem '));
        }
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    }on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
