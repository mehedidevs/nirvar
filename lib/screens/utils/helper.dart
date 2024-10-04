
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

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
      duration: const Duration(seconds: 3),
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
      duration: const Duration(seconds: 3),
    ).show(this);
  }
}




