import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nirvar/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:nirvar/bloc/forgot_password_otp_send/forgot_password_otp_send_bloc.dart';
import 'package:nirvar/bloc/forgot_password_reset/forgot_password_reset_bloc.dart';
import 'package:nirvar/bloc/login/login_bloc.dart';
import 'package:nirvar/bloc/logout/logout_bloc.dart';
import 'package:nirvar/bloc/password_change/password_change_bloc.dart';
import 'package:nirvar/bloc/register_otp_send/register_otp_send_bloc.dart';
import 'package:nirvar/bloc/register_user_credentials/register_user_credentials_bloc.dart';
import 'package:nirvar/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:nirvar/bloc/sign_up/signup_bloc.dart';
import 'package:nirvar/bloc/user_profile_details/user_profile_details_bloc.dart';
import 'package:nirvar/bloc/user_profile_update/user_profile_update_bloc.dart';
import 'package:nirvar/core/constants/constants.dart';
import 'package:nirvar/data/network/diabetes/diabetes_api_service.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';
import 'package:nirvar/repository/authentication/auth_repository_impl.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository_impl.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository_impl.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository_impl.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository_impl.dart';


import 'data/network/authentication/auth_api_service.dart';
import 'data/network/blood_pressure/blood_pressure_api_service.dart';
import 'data/network/file/file_api_service.dart';
import 'data/network/folder/folder_api_service.dart';
import 'data/preference/user_id_storage.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: appBaseURL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  );


  //Shared Preference
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  sl.registerLazySingleton<UserIdStorage>(() => UserIdStorage());

  //API Service
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()));
  sl.registerLazySingleton<FolderApiService>(() => FolderApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()));
  sl.registerLazySingleton<FileApiService>(() => FileApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()));
  sl.registerLazySingleton<BloodPressureApiService>(() => BloodPressureApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()));
  sl.registerLazySingleton<DiabetesApiService>(() => DiabetesApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()));


  //Binding The Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<AuthApiService>()));
  sl.registerLazySingleton<PatientFolderRepository>(() => PatientFolderRepositoryImpl(sl<FolderApiService>()));
  sl.registerLazySingleton<PatientFileRepository>(()=>PatientFileRepositoryImpl(sl<FileApiService>()));
  sl.registerLazySingleton<BloodPressureRepository>(()=>BloodPressureRepositoryImpl(sl<BloodPressureApiService>()));
  sl.registerLazySingleton<DiabetesRepository>(()=>DiabetesRepositoryImpl(sl<DiabetesApiService>()));



  //Bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl<AuthRepository>()));
  sl.registerFactory<LogOutBloc>(() => LogOutBloc(sl<AuthRepository>()));

  //Registration
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl<AuthRepository>()));
  sl.registerFactory<RegisterOtpSendBloc>(() => RegisterOtpSendBloc(sl<AuthRepository>()));
  sl.registerFactory<RegisterUseCredentialsBloc>(() => RegisterUseCredentialsBloc(sl<AuthRepository>()));

  //Profile
  sl.registerFactory<UserProfileDetailsBloc>(() => UserProfileDetailsBloc(sl<AuthRepository>()));
  sl.registerFactory<UserProfileUpdateBloc>(() => UserProfileUpdateBloc(sl<AuthRepository>()));



  //Forgot Password
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(sl<AuthRepository>()));
  sl.registerFactory<ForgotPasswordOtpSendBloc>(() => ForgotPasswordOtpSendBloc(sl<AuthRepository>()));
  sl.registerFactory<ForgotPasswordResetBloc>(() => ForgotPasswordResetBloc(sl<AuthRepository>()));

  //Change Password
  sl.registerFactory<PasswordChangeBloc>(() => PasswordChangeBloc(sl<AuthRepository>()));

  //Resend OTP
  sl.registerFactory<ResendOtpBloc>(() => ResendOtpBloc(sl<AuthRepository>()));



  await sl.allReady();
}