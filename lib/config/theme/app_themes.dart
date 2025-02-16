import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class AppTheme {
  static final TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700,color: Colors.black),
    titleMedium: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600,color: Colors.black),
    titleSmall: TextStyle(fontSize:16.sp, fontWeight: FontWeight.bold,color: Colors.white),

    bodyMedium: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
    bodySmall: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),

    labelSmall: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600)
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      surface: AppColors.white,
      primary: AppColors.primary,
      secondary: AppColors.white,
      tertiary: AppColors.white,
      inversePrimary: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    textTheme: lightTextTheme,
  );
}
