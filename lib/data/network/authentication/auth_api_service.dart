import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nirvar/models/user_credentials/user_credentials.dart';
import 'package:nirvar/models/user_profile/user_profile.dart';
import 'package:nirvar/models/user_profile_update/user_profile_update.dart';

import '../../../core/constants/constants.dart';
import '../../../core/resources/api_exception.dart';
import '../../../models/register_otp/register_otp.dart';
import '../../../models/user/user.dart';
import '../../preference/token_storage.dart';
import '../../preference/user_id_storage.dart';

class AuthApiService {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final UserIdStorage _userIdStorage;

  AuthApiService(this._dio, this._tokenStorage, this._userIdStorage) {
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

  Future<Either<ApiException, User>> loginUser(
      String phoneNumber, String password) async {
    try {
      final response = await _dio.post(
        patientLogin, //end point
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {
          'number': phoneNumber,
          'password': password,
        },
      );
      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 1) {
          User data = User.fromJson(responseData['data']);
          _tokenStorage.saveToken(responseData['token']);
          _userIdStorage.saveUserID(data.id);
          print(await _tokenStorage.getToken());
          print(await _userIdStorage.getUserID());
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Invalid Response'));
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

  Future<Either<ApiException, String>> logoutUser() async {
    try {
      final response = await _dio.post(patientLoginOut);

      print('REsponse : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.data);
        if (responseData['status'] == 1) {
          _tokenStorage.clearToken();
          _userIdStorage.clearUserID();
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

  Future<Either<ApiException, RegisterOtp>> registerOTP(
      String phoneNumber) async {
    try {
      final response = await _dio.post(
        patientRegister,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {"number": phoneNumber},
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          RegisterOtp data = RegisterOtp.fromJson(responseData['data']);
          _userIdStorage.saveUserID(data.id);
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException('The number has already been taken.'));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> registerOTPSend(int otp) async {
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');

    try {
      final response = await _dio.post(
        patientRegisterOTP,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {
          "user_id": userId,
          "otp": otp,
        },
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          _tokenStorage.saveToken(responseData['token']);
          print('USER ID FROM PREFS: $userId');
          print(await _tokenStorage.getToken());
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> registerUserCredentials(
      UserCredentials credentials) async {
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');

    try {
      final response = await _dio.post(
        patientProfileRegister,
        data: {
          "user_id": userId,
          "photo": credentials.photo,
          "name": credentials.name,
          "email": credentials.email,
          "password": credentials.password,
          "gender": credentials.gender,
          "date_of_birth": credentials.dateOfBirth,
          "blood_group": credentials.bloodGroup,
          "weight": credentials.weight,
          "height_ft": credentials.heightFt,
          "height_in": credentials.heightIn,
          "address": credentials.address,
        },
      );

      print('RESPONSE : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> getForgotPasswordOTP(
      String phoneNumber) async {
    try {
      final response = await _dio.post(
        patientForgotPasswordResetOTP,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {"number": phoneNumber},
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          //await _userIdStorage.saveUserID(responseData['user_id']);
          await _userIdStorage.saveUserID(responseData['data']['user_id']);
          int? userId = await _userIdStorage.getUserID();
          print('USER ID FROM PREFS: $userId');
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> sendForgotPasswordOTP(int otp) async {
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');

    try {
      final response = await _dio.post(
        patientForgotPasswordResetConfirm,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {
          "user_id": userId,
          "otp": otp,
        },
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          print('USER ID FROM PREFS: $userId');
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> forgotPasswordReset(String password) async {
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');
    try {
      final response = await _dio.post(
        patientForgotPasswordReset,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {
          "user_id": userId,
          "password": password,
        },
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> resendOTP() async {
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');
    try {
      final response = await _dio.post(
        patientResendOTP,
        options: Options(
          extra: {'requiresAuth': false},
        ),
        data: {"user_id": userId},
      );

      print('RESPONSE : $response');
      print('RESPONSE DATA: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> changeUserPassword(String oldPassword, String newPassword) async {

    try {
      final response = await _dio.post(patientPasswordChange, data: {
        "old_password": oldPassword,
        "new_password": newPassword,
      });
      print('RESPONSE : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, UserProfile>> getUserProfile() async{
    int? userId = await _userIdStorage.getUserID();
    if (userId == null) {
      return Left(ApiException('User ID is missing'));
    }
    print('USER ID FROM PREFS: $userId');
    try{
      final response = await _dio.get(
          '$patientProfile$userId'
      );

      print('RESPONSE : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          UserProfile profile = UserProfile.fromJson(responseData['data']);
          return Right(profile);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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

  Future<Either<ApiException, String>> updateUserProfile(UserProfileUpdate profile,File? imageFile) async{

    FormData formData = FormData.fromMap({
      'name': profile.name,
      'email': profile.email,
      'gender': profile.gender,
      'date_of_birth': profile.dateOfBirth,
      'blood_group': profile.bloodGroup,
      'weight': profile.weight,
      'height_ft': profile.heightFt,
      'height_in': profile.heightIn,
      'address': profile.address,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last, // Filename
          contentType: MediaType('image', _getFileExtension(imageFile.path)), // You can dynamically determine this
        ),
    });


    try{
      final response = await _dio.get(
          patientProfileUpdate,
          data: formData,
      );

      print('RESPONSE : $response');
      print('ResponseData : ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        if (responseData['status'] == 1) {
          String data = responseData['message'];
          return Right(data);
        } else if (responseData['status'] == 0) {
          return Left(ApiException(responseData['message']));
        } else {
          return Left(ApiException('Something Went Wrong'));
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
}


String _getFileExtension(String filePath) {
  final extension = filePath.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'jpeg';
    case 'png':
      return 'png';
    case 'webp':
      return 'webp';
    case 'heif':
      return 'heif';
    default:
      return 'jpeg'; // Fallback to jpeg
  }
}