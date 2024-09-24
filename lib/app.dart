import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/logout/logout_bloc.dart';
import 'package:nirvar/screens/auth/register_user_credentials_screen.dart';
import 'package:nirvar/screens/auth/splash_screen.dart';
import 'package:nirvar/config/theme/app_themes.dart';

import 'bloc/user_profile_details/user_profile_details_bloc.dart';
import 'injection_container.dart';

class NirvarApp extends StatefulWidget {
  const NirvarApp({super.key});

  @override
  State<NirvarApp> createState() => _NirvarAppState();
}

class _NirvarAppState extends State<NirvarApp> {
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
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            theme: AppTheme.lightTheme,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
