import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/assets_path.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textInput.dart';

class BloodGlucoseInput extends StatelessWidget {
  const BloodGlucoseInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Daily Input'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Center(
                  child: FittedBox(
                    child: Image.asset(
                      AssetsPath.bloodTransfusionPng,
                      height: 250.h,
                      width: 250.w,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Enter Your Today’s Glucose Points',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Points',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                const CustomTextField(hint: 'Ex. 5.5'),

                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  child: CustomButton(text: 'Submit', onPressed: (){}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
