import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/bloc/blood_pressure_average_last_seven_days/blood_pressure_average_last_seven_days_bloc.dart';
import 'package:nirvar/bloc/glucose_average_daily/glucose_average_daily_bloc.dart';
import 'package:nirvar/bloc/glucose_average_last_seven_days/glucose_average_last_seven_days_bloc.dart';
import 'package:nirvar/bloc/health_status_notification/health_status_notification_bloc.dart';
import 'package:nirvar/bloc/logout/logout_bloc.dart';
import 'package:nirvar/bloc/patient_files/patient_files_bloc.dart';
import 'package:nirvar/bloc/patient_folder/patient_folder_bloc.dart';
import 'package:nirvar/routes/routes.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/auth/splash_screen.dart';
import 'package:nirvar/config/theme/app_themes.dart';


import 'bloc/blood_pressure_average_daily/blood_pressure_average_daily_bloc.dart';
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
            BlocProvider(create: (context) => sl<PatientFolderBloc>()),
            BlocProvider(create: (context) => sl<PatientFileBloc>()),
            BlocProvider(create: (context) => sl<AccountHolderBloc>()),
            BlocProvider(create: (context) => sl<HealthStatusNotificationBloc>()),
            BlocProvider(create: (context) => sl<GlucoseAverageLastSevenDaysBloc>()),
            BlocProvider(create: (context) => sl<GlucoseAverageDailyBloc>()),
            BlocProvider(create: (context) => sl<BloodPressureAverageLastSevenDaysBloc>()),
            BlocProvider(create: (context) => sl<BloodPressureAverageDailyBloc>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: "Application",
            theme: AppTheme.lightTheme,
            onGenerateRoute:  RouteGenerator.generateRoute,
            initialRoute: RoutesName.splashScreen,
            navigatorObservers: [],
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
