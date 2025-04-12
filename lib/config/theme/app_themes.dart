import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

// class AppTheme {
//   static final TextTheme lightTextTheme = TextTheme(
//     titleLarge: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700,color: Colors.black),
//     titleMedium: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600,color: Colors.black),
//     titleSmall: TextStyle(fontSize:16.sp, fontWeight: FontWeight.bold,color: Colors.white),
//
//     bodyMedium: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
//     bodySmall: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),
//
//     labelSmall: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600)
//   );
//
//   static final ThemeData lightTheme = ThemeData(
//     colorScheme: ColorScheme.light(
//       surface: AppColors.white,
//       primary: AppColors.primary,
//       secondary: AppColors.white,
//       tertiary: AppColors.white,
//       inversePrimary: AppColors.white,
//     ),
//     scaffoldBackgroundColor: AppColors.white,
//     brightness: Brightness.light,
//     fontFamily: 'Roboto',
//     textTheme: lightTextTheme,
//   );
// }

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: AppColors.white,
    primary: AppColors.primary,
    secondary: AppColors.white,
    tertiary: AppColors.white,
    inversePrimary: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.light,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 57.sp,
        height: 64 / 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
      ),
    ),
    displayMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 45.sp,
        height: 52 / 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    displaySmall: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 36.sp,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    headlineLarge: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 32.sp,
        height: 40 / 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    headlineMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 28.sp,
        height: 36 / 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    headlineSmall: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 24.sp,
        height: 32 / 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    titleLarge: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 22.sp,
        height: 28 / 22,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    ),
    titleMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    ),
    titleSmall: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
    ),
    bodyLarge: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
    bodyMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
    ),
    bodySmall: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 12.sp,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
    ),
    labelLarge: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
    ),
    labelMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 12.sp,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    ),
    labelSmall: GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 11.sp,
        height: 16 / 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    ),
  ),
);


// ThemeData lightMode = ThemeData(
//   colorScheme: ColorScheme.light(
//     surface: AppColors.white,
//     primary: AppColors.primary,
//     secondary: AppColors.white,
//     tertiary: AppColors.white,
//     inversePrimary: AppColors.white,
//   ),
//   scaffoldBackgroundColor: AppColors.white,
//   brightness: Brightness.light,
//   textTheme: TextTheme(
//     displayLarge: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 36.sp,
//           height: 1.5,
//           fontWeight: FontWeight.w600),
//     ),
//     displayMedium: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 26.sp,
//           fontWeight: FontWeight.bold),
//     ),
//     displaySmall: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 22.sp,
//           fontWeight: FontWeight.bold),
//     ),
//     titleLarge: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 18.sp,
//           fontWeight: FontWeight.w600),
//     ),
//     titleMedium: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600),
//     ),
//     titleSmall: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500),
//     ),
//     bodyLarge: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.normal),
//     ),
//     bodyMedium: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.normal),
//     ),
//     bodySmall: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.grey,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.normal),
//     ),
//     labelLarge: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 12.spMax,
//           fontWeight: FontWeight.normal),
//     ),
//     labelMedium: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 10.spMax,
//           fontWeight: FontWeight.normal),
//     ),
//     labelSmall: GoogleFonts.roboto(
//       textStyle: TextStyle(
//           color: AppColors.black,
//           fontSize: 8.spMax,
//           fontWeight: FontWeight.normal),
//     ),
//   ),
// );
