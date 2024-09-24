import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/custom_app_bar.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';
import 'package:nirvar/screens/widgets/custom_textInput.dart';

class BloodPressureInput extends StatelessWidget {
  const BloodPressureInput({super.key});

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
                      AssetsPath.bloodPressurePng,
                      height: 250.h,
                      width: 250.w,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Enter Your Today’s Blood Pressure',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Systolic',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                const CustomTextField(hint: 'Ex. 140'),

                SizedBox(height: 20.h),
                Text(
                  'Diastolic',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 8.h),
                const CustomTextField(hint: 'Ex. 140'),

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
