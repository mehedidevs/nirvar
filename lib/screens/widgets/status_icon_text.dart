import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusIconText extends StatelessWidget {
  final String assetPath;
  final String text;
  final Color textColor;

  const StatusIconText({
    Key? key,
    required this.assetPath,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenUtil().screenHeight * 0.5.h),
            SvgPicture.asset(
              assetPath,
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(height: 20.h),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
