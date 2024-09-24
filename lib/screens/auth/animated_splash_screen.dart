import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/auth/sign_in_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().screenHeight * .15.h),
              SvgPicture.asset(
                AssetsPath.splashLogoSvg,
                height: 150.h,
                width: 150.w,
              )
                  .animate()
                  .fadeIn(duration: 1.seconds)
                  .moveY(begin: ScreenUtil().screenHeight, end: 0, duration: 1.seconds,curve: Curves.easeInOut),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.only(right: 32.w, bottom: 32.h),
                child: SvgPicture.asset(
                  AssetsPath.tagLineSvg,
                  height: ScreenUtil().screenHeight * .05.h,
                )
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .moveX(begin: -50, end: 0, duration: 1.seconds)
                    .scale(delay: 1.seconds),
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: SvgPicture.asset(
                  AssetsPath.tagLine2Svg,
                  height: ScreenUtil().screenHeight * .05.h,
                )
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .moveX(begin: -50, end: 0, duration: 1.seconds)
                    .scale(delay: 2.seconds),
              ),
              SizedBox(height: ScreenUtil().screenHeight * .1.h),
              CustomButton(text: '>>', onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
              })
                  .animate()
                  .fadeIn(duration: 1.seconds)
                  .moveX(begin: -50, end: 0, duration: 1.seconds)
                  .scale(delay: 3.seconds),
            ],
          ),
        ),
      ),
    );
  }
}
