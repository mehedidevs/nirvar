import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';

import '../../../notification/notification_screen.dart';
import '../../../widgets/custom_dropdown.dart';

class TestReportUploadScreen extends StatefulWidget {
  const TestReportUploadScreen({super.key});

  @override
  State<TestReportUploadScreen> createState() => _TestReportUploadScreenState();
}

class _TestReportUploadScreenState extends State<TestReportUploadScreen> {

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Upload',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(hasNotification: true),
                  ),
                );
              },
              icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg)
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                DottedBorder(
                  color: AppColors.primary.withOpacity(0.5),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.r),
                  dashPattern: [6, 3],
                  strokeWidth: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsPath.uploadSvg, // Replace with your actual asset path
                          height: 60.h,
                          width: 60.w,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Select your file(s) to upload',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            // Handle file selection
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.paleLight,
                            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Browse Files',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomDropdown(
                  hintText: 'Choose a Category',
                  icon: SvgPicture.asset(
                    AssetsPath.stackSvg,
                    fit: BoxFit.scaleDown,
                  ),
                  items: const ['Medicine', 'Reports', 'Images', 'Documents'],
                  selectedValue: _selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: ScreenUtil().screenHeight *.2.h),
                // Upload button
                Center(
                  child: CustomButton(text: 'Upload', onPressed: (){}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
