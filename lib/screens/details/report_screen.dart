import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/screens/details/report_details_screen.dart';
import 'package:nirvar/screens/widgets/custom_app_bar.dart';

import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ReportScreen extends StatelessWidget {
  final String title;

  const ReportScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM yyyy').format(now);
    return Scaffold(
      appBar: CustomAppBar(title: title),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _healthItem('Dr Jubaer - prescription', formattedDate,
                    AssetsPath.prescriptionPng, context),
                _healthItem('Dr Yousuf - prescription', formattedDate,
                    AssetsPath.prescriptionPng, context),
                _healthItem('Dr Imran - prescription', formattedDate,
                    AssetsPath.prescriptionPng, context),
                _healthItem('Dr Jahirul - prescription', formattedDate,
                    AssetsPath.prescriptionPng, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _healthItem(
      String title, String subtitle, String imageUrl, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportDetailsScreen(imageUrl: imageUrl,title: title,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.pale, // Light background color
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imageUrl,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50), // Dark text color
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
