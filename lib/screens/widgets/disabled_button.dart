import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ScreenUtils for responsive design

class DisabledButton extends StatelessWidget {
  final String buttonText;
  final double widthFactor;
  final double heightFactor;

  const DisabledButton({
    Key? key,
    required this.buttonText,
    this.widthFactor = 0.9,
    this.heightFactor = 0.08,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth * widthFactor, // Using ScreenUtils for responsive width
      height: ScreenUtil().screenHeight * heightFactor, // Using ScreenUtils for responsive height
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6BB5BE).withOpacity(0.2), // 20% opacity of #6BB5BE
            Color(0xFF74B192).withOpacity(0.2), // 20% opacity of #74B192
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.r), // Rounded corners
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.grey.shade500, // Disabled text color
            fontSize: 18.sp, // Responsive font size
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
