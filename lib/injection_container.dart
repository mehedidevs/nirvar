import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:nirvar/bloc/forgot_password_otp_send/forgot_password_otp_send_bloc.dart';
import 'package:nirvar/bloc/forgot_password_reset/forgot_password_reset_bloc.dart';
import 'package:nirvar/bloc/login/login_bloc.dart';
import 'package:nirvar/bloc/logout/logout_bloc.dart';
import 'package:nirvar/bloc/password_change/password_change_bloc.dart';
import 'package:nirvar/bloc/patient_files/patient_files_bloc.dart';
import 'package:nirvar/bloc/patient_folder/patient_folder_bloc.dart';
import 'package:nirvar/bloc/register_otp_send/register_otp_send_bloc.dart';
import 'package:nirvar/bloc/register_user_credentials/register_user_credentials_bloc.dart';
import 'package:nirvar/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:nirvar/bloc/sign_up/signup_bloc.dart';
import 'package:nirvar/bloc/user_profile_details/user_profile_details_bloc.dart';
import 'package:nirvar/bloc/user_profile_update/user_profile_update_bloc.dart';
import 'package:nirvar/core/constants/app_contstants.dart';
import 'package:nirvar/data/local/dao/account_holder_dao.dart';
import 'package:nirvar/data/local/db/account_holder_database.dart';
import 'package:nirvar/data/network/authentication/auth_api_service.dart';
import 'package:nirvar/data/network/blood_pressure/blood_pressure_api_service.dart';
import 'package:nirvar/data/network/diabetes/diabetes_api_service.dart';
import 'package:nirvar/data/network/file/file_api_service.dart';
import 'package:nirvar/data/network/folder/folder_api_service.dart';
import 'package:nirvar/data/network/notification/notification_api_service.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/repository/account_holder/account_holder_repository.dart';
import 'package:nirvar/repository/account_holder/account_holder_repository_impl.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';
import 'package:nirvar/repository/authentication/auth_repository_impl.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository_impl.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository_impl.dart';
import 'package:nirvar/repository/notification/notification_repository.dart';
import 'package:nirvar/repository/notification/notification_repository_impl.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository_impl.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository_impl.dart';

import 'core/constants/constants.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Register Local Database
  _initializeLocalDatabase();

  // Register Device Info Plugin
  sl.registerSingleton<DeviceInfoPlugin>(DeviceInfoPlugin());

  // Register Dio with custom base options
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: appBaseURL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    ),
  );

  // Register Shared Preferences
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  sl.registerLazySingleton<UserIdStorage>(() => UserIdStorage());

  // Register API Services
  _initializeApiServices();

  // Register Repositories
  _initializeRepositories();

  // Register Blocs
  _initializeBlocs();

  await sl.allReady();
}

void _initializeLocalDatabase() {
  // Database
  sl.registerSingletonAsync<AccountHolderDatabase>(
        () async => await $FloorAccountHolderDatabase
        .databaseBuilder(AppConstants.accountHolderDatabaseName)
        .build(),
  );

  // DAO
  sl.registerSingletonWithDependencies<AccountHolderDao>(
        () => sl<AccountHolderDatabase>().accountHolderDAO,
    dependsOn: [AccountHolderDatabase],
  );

  // Repository
  sl.registerSingletonWithDependencies<AccountHolderRepository>(
        () => AccountHolderRepositoryImpl(sl<AccountHolderDao>()),
    dependsOn: [AccountHolderDao],
  );
}

void _initializeApiServices() {
  sl.registerLazySingleton<AuthApiService>(
        () => AuthApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
  sl.registerLazySingleton<FolderApiService>(
        () => FolderApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
  sl.registerLazySingleton<FileApiService>(
        () => FileApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
  sl.registerLazySingleton<BloodPressureApiService>(
        () => BloodPressureApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
  sl.registerLazySingleton<DiabetesApiService>(
        () => DiabetesApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
  sl.registerLazySingleton<NotificationApiService>(
        () => NotificationApiService(sl<Dio>(), sl<TokenStorage>(), sl<UserIdStorage>()),
  );
}

void _initializeRepositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<AuthApiService>()));
  sl.registerLazySingleton<PatientFolderRepository>(() => PatientFolderRepositoryImpl(sl<FolderApiService>()));
  sl.registerLazySingleton<PatientFileRepository>(() => PatientFileRepositoryImpl(sl<FileApiService>()));
  sl.registerLazySingleton<BloodPressureRepository>(() => BloodPressureRepositoryImpl(sl<BloodPressureApiService>()));
  sl.registerLazySingleton<DiabetesRepository>(() => DiabetesRepositoryImpl(sl<DiabetesApiService>()));
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(sl<NotificationApiService>()));
}

void _initializeBlocs() {
  // Authentication
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl<AuthRepository>()));
  sl.registerFactory<LogOutBloc>(() => LogOutBloc(sl<AuthRepository>()));
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl<AuthRepository>()));
  sl.registerFactory<RegisterOtpSendBloc>(() => RegisterOtpSendBloc(sl<AuthRepository>()));
  sl.registerFactory<RegisterUseCredentialsBloc>(() => RegisterUseCredentialsBloc(sl<AuthRepository>()));
  sl.registerFactory<UserProfileDetailsBloc>(() => UserProfileDetailsBloc(sl<AuthRepository>()));
  sl.registerFactory<UserProfileUpdateBloc>(() => UserProfileUpdateBloc(sl<AuthRepository>()));
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(sl<AuthRepository>()));
  sl.registerFactory<ForgotPasswordOtpSendBloc>(() => ForgotPasswordOtpSendBloc(sl<AuthRepository>()));
  sl.registerFactory<ForgotPasswordResetBloc>(() => ForgotPasswordResetBloc(sl<AuthRepository>()));
  sl.registerFactory<PasswordChangeBloc>(() => PasswordChangeBloc(sl<AuthRepository>()));
  sl.registerFactory<ResendOtpBloc>(() => ResendOtpBloc(sl<AuthRepository>()));

  // Patient Management
  sl.registerFactory<PatientFolderBloc>(() => PatientFolderBloc(sl<PatientFolderRepository>()));
  sl.registerFactory<PatientFileBloc>(() => PatientFileBloc(sl<PatientFileRepository>()));

  // Account Holder
  sl.registerFactory<AccountHolderBloc>(() => AccountHolderBloc(sl<AccountHolderRepository>(), sl<AuthRepository>()));
}
