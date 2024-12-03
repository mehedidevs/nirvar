import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/bloc/logout/logout_bloc.dart';
import 'package:nirvar/bloc/patient_files/patient_files_bloc.dart';
import 'package:nirvar/bloc/patient_folder/patient_folder_bloc.dart';
import 'package:nirvar/screens/auth/register_user_credentials_screen.dart';
import 'package:nirvar/config/theme/app_themes.dart';

import 'bloc/user_profile_details/user_profile_details_bloc.dart';
import 'injection_container.dart';
import 'main.dart';

class NirvarApp extends StatelessWidget {
  const NirvarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<UserProfileDetailsBloc>()),
            BlocProvider(create: (context) => sl<LogOutBloc>()),
            BlocProvider(create: (context) => sl<PatientFolderBloc>()..add(GetPatientFolderFromApi())),
            BlocProvider(create: (context) => sl<PatientFileBloc>()),
            BlocProvider(create: (context) => sl<AccountHolderBloc>()..add(FetchAllAccountHolders())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: "Application",
            theme: AppTheme.lightTheme,
            home: RegisterUserCredentialsScreen(),
          ),
        );
      },
    );
  }
}
