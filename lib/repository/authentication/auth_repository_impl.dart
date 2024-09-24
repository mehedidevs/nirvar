
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/authentication/auth_api_service.dart';
import 'package:nirvar/models/register_otp/register_otp.dart';
import 'package:nirvar/models/user/user.dart';
import 'package:nirvar/models/user_credentials/user_credentials.dart';
import 'package:nirvar/models/user_profile/user_profile.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{

  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<Either<ApiException, User>> loginUser(String phoneNumber, String password) {
    return _authApiService.loginUser(phoneNumber, password);
  }

  @override
  Future<Either<ApiException, RegisterOtp>> registerOTP(String phoneNumber) {
    return _authApiService.registerOTP(phoneNumber);
  }

  @override
  Future<Either<ApiException, String>> getForgotPasswordOTP(String phoneNumber) {
    return _authApiService.getForgotPasswordOTP(phoneNumber);
  }

  @override
  Future<Either<ApiException, String>> sendForgotPasswordOTP(int otp) {
   return _authApiService.sendForgotPasswordOTP(otp);
  }


  @override
  Future<Either<ApiException, String>> resendOTP() {
   return _authApiService.resendOTP();
  }

  @override
  Future<Either<ApiException, String>> forgotPasswordReset(String password) {
    return _authApiService.forgotPasswordReset(password);
  }

  @override
  Future<Either<ApiException, String>> logoutUser() {
   return _authApiService.logoutUser();
  }

  @override
  Future<Either<ApiException, String>> registerOTPSend(int otp) {
   return _authApiService.registerOTPSend(otp);
  }

  @override
  Future<Either<ApiException, String>> registerUserCredentials(UserCredentials credentials) {
    return _authApiService.registerUserCredentials(credentials);
  }

  @override
  Future<Either<ApiException, String>> changeUserPassword(String oldPassword, String newPassword) {
    return _authApiService.changeUserPassword(oldPassword, newPassword);
  }

  @override
  Future<Either<ApiException, UserProfile>> getUserProfile() {
    return _authApiService.getUserProfile();
  }

}