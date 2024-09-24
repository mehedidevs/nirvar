import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class SaveChangesButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveChangesButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 0.8.sw,  // Responsive width using ScreenUtil (adjust as needed)
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Color(0xFFEAF5F7),  // Light greenish-blue background color
          borderRadius: BorderRadius.circular(32.r),  // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),  // Subtle shadow color
              blurRadius: 10,  // Shadow blur radius
              offset: Offset(0, 4),  // Shadow offset
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Save Changes',
            style: TextStyle(
              fontSize: 16.sp,
              color:AppColors.primary,  // Text color to match your theme
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
