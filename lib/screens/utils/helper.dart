
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/local/entity/account_holder.dart';
import '../../models/created_folder_for_prescription/created_folder_for_prescription.dart';
import '../../models/patient_folder/patient_folder.dart';
import '../../models/user/user.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
// Helper method to show error message
extension FlushBarMessage on BuildContext {
  void flushBarErrorMessage({required String message}) {
    Flushbar(
      message: message,
      messageColor: AppColors.red,
      backgroundColor: AppColors.background,
      icon: Icon(
        Icons.error,
        size: 28.sp,
        color: AppColors.red,
      ),
      leftBarIndicatorColor: AppColors.red,
      duration: const Duration(seconds: 2),
    ).show(this);
  }

  // Helper method to show success message
  void flushBarSuccessMessage({required String message}) {
    Flushbar(
      message: message,
      messageColor: AppColors.primary,
      backgroundColor: AppColors.background,
      icon:  Icon(
        Icons.check_circle,
        size: 25.sp,
        color: AppColors.primary,
      ),
      leftBarIndicatorColor: AppColors.primary,
      duration: const Duration(seconds: 2),
    ).show(this);
  }
}

extension CreatedFolderForPrescriptionMapper on CreatedFolderForPrescription {
  PatientFolder toPatientFolder() {
    return PatientFolder(
      folderId: id ?? 0, // Handle null id safely
      userId: userId,
      name: name,
      fileCount: 0, // Since `CreatedFolderForPrescription` doesn't have `file_count`, you can set it to a default value (e.g., 0)
      createdAt: createdAt?.toIso8601String() ?? '', // Convert DateTime to String and handle null cases
    );
  }
}

extension UserToAccountHolder on User {
  /// Converts a User object and password into an AccountHolder object.
  AccountHolder toAccountHolder(String password) {
    return AccountHolder(
      id: id,
      name: name,
      email: email,
      number: number,
      password: password, // Add the password explicitly
      photo: photo,
      role: role,
    );
  }
}

// Dropdown options for Blood Group and Gender
final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
final List<String> genders = ['Male', 'Female', 'Other'];

/// Function to show a custom date picker
Future<String> pickDate(BuildContext context) async {
  DateTime initialDate = DateTime.now();
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900), // Allow dates from 2000
    lastDate: DateTime(2100), // Allow dates up to 2100
    helpText: 'Select Date',
    fieldLabelText: 'Enter Date',
    fieldHintText: 'Month/Date/Year',
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogTheme: DialogTheme(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    // Format the selected date and set it in the TextFormField
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    return formattedDate;
  }

  return 'No Date Is Found';
}


// final List<String> healthMessages = [
//   "It's health check-in time! Kindly record your blood pressure and blood glucose to stay on track with your wellness goals.",
//   "Your health is your wealth! Please check both your blood pressure and blood glucose to keep things balanced.",
//   "A small step for your health! Record your blood pressure and blood glucose readings to ensure you're on the right track.",
//   "Stay proactive with your health! Take a moment to log your blood pressure and blood glucose today.",
//   "Your well-being matters! Please measure your blood pressure and blood glucose to keep things in balance.",
//   "Time for a quick health update! Record your blood pressure and blood glucose to stay consistent and informed.",
//   "Your health journey starts with small steps! Take a moment to check your blood pressure and blood glucose.",
//   "Healthy habits lead to a better you! Kindly track your blood pressure and blood glucose readings now.",
//   "Let’s keep it steady! Record your blood pressure and blood glucose to maintain a healthy rhythm.",
//   "A healthier tomorrow starts today! Don’t forget to log your blood pressure and blood glucose readings now.",
//   "Your health deserves attention! Check your blood pressure and blood glucose and celebrate your progress.",
//   "Consistency is the key to wellness! Please take a moment to measure and record your blood pressure and blood glucose.",
// ];

final List<String> healthMessages = [
  "Time to log your blood pressure and glucose. Stay on track!",
  "Quick health check: Record BP and glucose levels now.",
  "Monitor your health—log BP and glucose today.",
  "Stay balanced! Check BP and glucose readings.",
  "Your health matters. Log BP and glucose now.",
  "Daily reminder: Track BP and glucose for wellness.",
  "Keep health in check—record BP and glucose.",
  "Small step, big impact: Log BP and glucose.",
  "Stay proactive! Measure BP and glucose today.",
  "Healthy habits start now. Log BP and glucose.",
  "Consistency wins. Record BP and glucose.",
  "Quick update: Check BP and glucose levels.",
];

String getRandomHealthMessage() {
  return healthMessages[DateTime.now().millisecondsSinceEpoch % healthMessages.length];
}

// Email function to launch the default email app
void sendEmail(BuildContext context) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'team.nirvartech@gmail.com', //need to change in here
    query: encodeQueryParameters(<String, String>{
      'subject': 'Delete My Information',
      'body': 'Dear Nirvar Team,\n\n'
          'I would like to request the deletion of all my personal data associated with my account on Nirvar. '
          'Please find my account details below:\n\n'
          'Name: [Your Name]\n'
          'Email: [Your Email Address]\n'
          'Phone Number: [Your Phone Number]\n\n'
          'If you need any further information to process this request, please let me know. '
          'I would appreciate a confirmation once the deletion process is completed.\n\n'
          'Thank you for your assistance.\n\n'
          'Best regards,\n[Your Name]',
    }),
  );


  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(
        emailLaunchUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch email client.';
    }
  } catch (e) {
    if(context.mounted){
      context.flushBarErrorMessage(message: 'Could not open the email client. Please ensure you have an email app installed and try again.');
    }
    debugPrint('Error launching email: $e');
  }
}


String? getMatchedValue(String? value, List<String> list) {
  if (value == null || value.isEmpty) return null;

  // Find the first matching value (case-insensitive)
  return list.firstWhere(
        (item) => item.toLowerCase() == value.toLowerCase(),
    orElse: () =>  ' ',
  );
}


bool isPdf(String url) {
  // Convert the string to lowercase and check if it contains '.pdf'
  return url.toLowerCase().contains('.pdf');
}

void statusBarSetup() {
  SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
         statusBarColor: Colors.black26,
          statusBarBrightness: Brightness.light, // Dark text for status bar
      )
  );

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // Transparent status bar
  //   statusBarBrightness: Brightness.dark, // Dark text for status bar
  // ));
}



String formatCustomDate(DateTime date) {
  final dayOfWeek = DateFormat('EEEE').format(date);

  final day = date.day;
  final suffix = getDaySuffix(day);

  final monthYear = DateFormat('MMMM yyyy').format(date);

  return '$dayOfWeek, ${day}$suffix $monthYear';
}

String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}





