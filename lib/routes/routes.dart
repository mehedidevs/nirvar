import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nirvar/data/local/entity/account_holder.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.animatedSplashScreen:
        return MaterialPageRoute(builder: (_) => const AnimatedSplashScreen());
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RoutesName.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case RoutesName.registerUserCredentials:
        return MaterialPageRoute(builder: (_) => const RegisterUserCredentialsScreen());
      case RoutesName.otpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtpScreen(phoneNumber: phoneNumber));
      case RoutesName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RoutesName.forgotPasswordOtpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ForgotPasswordOtpScreen(phoneNumber: phoneNumber));
      case RoutesName.fileDetailsScreen:
        final patientFile = settings.arguments as PatientFile;
        return MaterialPageRoute(builder: (_) => ReportDetailsScreen(file: patientFile));
      case RoutesName.folderDetailsScreen:
        final patientFolder = settings.arguments as PatientFolder;
        return MaterialPageRoute(builder: (_) => FolderDetailsScreen(folder: patientFolder));
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.myFilesScreen:
        return MaterialPageRoute(builder: (_) => const MyFiles());
      case RoutesName.qrCodeScreen:
        final folderId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) =>  QrCodeScreen(folderId: folderId));
      case RoutesName.prescriptionUploadScreen:
        final folderId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) =>  PrescriptionUploadScreen(folderId: folderId));
      case RoutesName.testReportUploadScreen:
        final folderId = settings.arguments as int;
        final folderName = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  TestReportUploadScreen(folderId: folderId, folderName: folderName));
      case RoutesName.randomlyTestReportUploadScreen:
        return MaterialPageRoute(builder: (_) => const RandomlyTestReportUploadScreen());
      case RoutesName.randomlyPrescriptionUploadScreen:
        return MaterialPageRoute(builder: (_) => const RandomlyPrescriptionUploadScreen());
      case RoutesName.accountSettingsScreen:
        return MaterialPageRoute(builder: (_) => AccountSettingsScreen());
      case RoutesName.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RoutesName.statsScreen:
        return MaterialPageRoute(builder: (_) => const StatsScreen());
      case RoutesName.bloodGlucoseInput:
        return MaterialPageRoute(builder: (_) => const BloodGlucoseInput());
      case RoutesName.bloodGlucoseBottomSheet:
        return MaterialPageRoute(builder: (_) => const BloodGlucoseBottomSheet());
      case RoutesName.bloodPressureBottomSheet:
        return MaterialPageRoute(builder: (_) => const BloodPressureBottomSheet());
      case RoutesName.bloodPressureInput:
        return MaterialPageRoute(builder: (_) => const BloodPressureInput());
      case RoutesName.notificationScreen:
        final isComingFromNotification = settings.arguments as bool;
        return MaterialPageRoute(builder: (_) => NotificationScreen(isComingFromNotification: isComingFromNotification));
      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case RoutesName.accountHoldersScreen:
        return MaterialPageRoute(builder: (_) => const AccountHoldersScreen());
      case RoutesName.switchAccountScreen:
        final accountHolder = settings.arguments as AccountHolder;
        return MaterialPageRoute(builder: (_) => SwitchAccountScreen(accountHolder: accountHolder));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
