import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

class WelcomeScreen extends StatelessWidget {
  final String logoPath;
  final String welcomeText;
  final String descriptionText;
  final List<Widget> children;

  const WelcomeScreen({
    super.key,
    required this.logoPath,
    required this.welcomeText,
    required this.descriptionText,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtil().screenHeight * .08.h,
              ),
              SvgPicture.asset(
                logoPath, // Use logoPath parameter
                width: double.infinity,
                height: 25.h,
              ),
              SizedBox(height: 30.h),
              Text(
                welcomeText,
                style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              ...children, // Add the additional children widgets here
            ],
          ),
        ),
      ),
    );
  }
}
