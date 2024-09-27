import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

class ReportDetailsScreen extends StatelessWidget {
  final PatientFile file;

  const ReportDetailsScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          file.name ?? '',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight * 0.01.h,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: file.path == null
                  ? Image.asset(
                      AssetsPath.prescriptionDetailsPng,
                      width: ScreenUtil().screenWidth * 0.8,
                      height: ScreenUtil().screenHeight * 0.7.h,
                    )
                  : Image.network(
                      file.path ?? "",
                      width: ScreenUtil().screenWidth * 0.8,
                      height: ScreenUtil().screenHeight * 0.7.h,
                    ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCustomButton(
                    context,
                    'Share',
                    Icons.share,
                    Color(0xFFEAF5F7),
                    Colors.black,
                  ),
                  _buildCustomButton(
                    context,
                    'Download',
                    Icons.download,
                    const LinearGradient(
                      colors: [
                        AppColors.boxGradiantStart,
                        AppColors.boxGradiantEnd,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context,
    String text,
    IconData icon,
    dynamic background,
    Color textColor,
  ) {
    return Container(
      width: 0.4.sw, // Width is 40% of screen width
      height: 50.h,
      decoration: BoxDecoration(
        gradient: background is LinearGradient ? background : null,
        color: background is Color ? background : null,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: textColor,
              ),
            ),
            SizedBox(width: 8.w), // Add spacing between text and icon
            Icon(
              icon,
              color: textColor,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

// Widget _buildCustomButton(
//     BuildContext context, String text, IconData icon, dynamic background, Color textColor) {
//   return Container(
//     width: 0.4.sw, // Width is 40% of screen width
//     height: 50.h,
//     decoration: BoxDecoration(
//       gradient: background is LinearGradient ? background : null,
//       color: background is Color ? background : null,
//       borderRadius: BorderRadius.circular(20.r),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     ),
//     child: ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(
//         icon,
//         color: textColor,
//         size: 20.sp,
//       ),
//       label: Text(
//         text,
//         style: TextStyle(
//           fontSize: 16.sp,
//           color: textColor,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(vertical: 14.h),
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//       ),
//     ),
//   );
// }
}
