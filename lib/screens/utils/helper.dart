
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../../data/local/entity/account_holder.dart';
import '../../models/created_folder_for_prescription/created_folder_for_prescription.dart';
import '../../models/patient_folder/patient_folder.dart';
import '../../models/user/user.dart';

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






