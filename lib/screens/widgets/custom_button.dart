import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double widthFactor;
  final double heightFactor;
  final List<Color> gradientColors;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.widthFactor = 0.9, // Default to 80% of screen width
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
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}