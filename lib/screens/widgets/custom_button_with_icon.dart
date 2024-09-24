import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double widthFactor;
  final double heightFactor;
  final List<Color> gradientColors;
  final IconData icon;

  const CustomButtonWithIcon({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.widthFactor = 0.9, // Default to 90% of screen width
    this.heightFactor = 0.08, // Default to 8% of screen height
    this.gradientColors = const [Color(0xFF6BB5BE), Color(0xFF74B192)],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtil().screenWidth * widthFactor,
        height: ScreenUtil().screenHeight * heightFactor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  )
                ),
                SizedBox(width: 4.w), // Add spacing between text and icon
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.sp, // Icon size can be adjusted as needed
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

