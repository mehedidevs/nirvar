import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';
import '../../models/register_otp/register_otp.dart';
import '../../models/user/user.dart';
import '../../models/user_credentials/user_credentials.dart';
import '../../models/user_profile/user_profile.dart';
import '../../models/user_profile_update/user_profile_update.dart';

abstract class AuthRepository{
  Future<Either<ApiException, User>> loginUser(String phoneNumber, String password);
  Future<Either<ApiException,String>> logoutUser();

  //REGISTER
  Future<Either<ApiException, RegisterOtp>> registerOTP(String phoneNumber);
  Future<Either<ApiException, String>> registerOTPSend(int otp);
  Future<Either<ApiException, String>> registerUserCredentials(UserCredentials credentials);
  Future<Either<ApiException, UserProfile>> getUserProfile();
  Future<Either<ApiException, String>> updateUserProfile(UserProfileUpdate profile,File? imageFile);

  //FORGOT PASSWORD
  Future<Either<ApiException,String>> getForgotPasswordOTP(String phoneNumber);
  Future<Either<ApiException,String>> sendForgotPasswordOTP(int otp);
  Future<Either<ApiException,String>> forgotPasswordReset(String password);

  //CHANGE PASSWORD
  Future<Either<ApiException, String>> changeUserPassword(String oldPassword, String newPassword);

  //RESEND OTP
  Future<Either<ApiException,String>> resendOTP();
}