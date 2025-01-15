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
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.animatedSplashScreen:
        return MaterialPageRoute(builder: (context) => const AnimatedSplashScreen());
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RoutesName.changePassword:
        return MaterialPageRoute(builder: (context) => const ChangePassword());
      case RoutesName.registerUserCredentials:
        return MaterialPageRoute(builder: (context) => const RegisterUserCredentialsScreen());
      case RoutesName.otpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: phoneNumber));
      case RoutesName.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case RoutesName.forgotPasswordOtpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => ForgotPasswordOtpScreen(phoneNumber: phoneNumber));
      case RoutesName.fileDetailsScreen:
        final patientFile = settings.arguments as PatientFile;
        return MaterialPageRoute(builder: (context) => ReportDetailsScreen(file: patientFile));
      case RoutesName.folderDetailsScreen:
        final patientFolder = settings.arguments as PatientFolder;
        return MaterialPageRoute(builder: (context) => FolderDetailsScreen(folder: patientFolder));
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.myFilesScreen:
        return MaterialPageRoute(builder: (context) => const MyFiles());
      case RoutesName.qrCodeScreen:
        final folderId = settings.arguments as int;
        return MaterialPageRoute(builder: (context) =>  QrCodeScreen(folderId: folderId));
      case RoutesName.prescriptionUploadScreen:
        final folderId = settings.arguments as int;
        return MaterialPageRoute(builder: (context) =>  PrescriptionUploadScreen(folderId: folderId));
      case RoutesName.testReportUploadScreen:
        final folderId = settings.arguments as int;
        final folderName = settings.arguments as String;
        return MaterialPageRoute(builder: (context) =>  TestReportUploadScreen(folderId: folderId, folderName: folderName));
      case RoutesName.randomlyTestReportUploadScreen:
        return MaterialPageRoute(builder: (context) => const RandomlyTestReportUploadScreen());
      case RoutesName.randomlyPrescriptionUploadScreen:
        return MaterialPageRoute(builder: (context) => const RandomlyPrescriptionUploadScreen());
      case RoutesName.accountSettingsScreen:
        return MaterialPageRoute(builder: (context) => AccountSettingsScreen());
      case RoutesName.editProfileScreen:
        return MaterialPageRoute(builder: (context) => const EditProfileScreen());
      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RoutesName.statsScreen:
        return MaterialPageRoute(builder: (context) => const StatsScreen());
      case RoutesName.bloodGlucoseInput:
        return MaterialPageRoute(builder: (context) => const BloodGlucoseInput());
      case RoutesName.bloodGlucoseBottomSheet:
        return MaterialPageRoute(builder: (context) => const BloodGlucoseBottomSheet());
      case RoutesName.bloodPressureBottomSheet:
        return MaterialPageRoute(builder: (context) => const BloodPressureBottomSheet());
      case RoutesName.bloodPressureInput:
        return MaterialPageRoute(builder: (context) => const BloodPressureInput());
      case RoutesName.notificationScreen:
        return MaterialPageRoute(builder: (context) => NotificationScreen());
      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case RoutesName.accountHoldersScreen:
        return MaterialPageRoute(builder: (context) => const AccountHoldersScreen());
      case RoutesName.switchAccountScreen:
        final accountHolder = settings.arguments as AccountHolder;
        return MaterialPageRoute(builder: (context) => SwitchAccountScreen(accountHolder: accountHolder));
      case RoutesName.deleteInformationScreen:
        return MaterialPageRoute(builder: (context) => DeleteInformationScreen());
      case RoutesName.privacyPolicyScreen:
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
