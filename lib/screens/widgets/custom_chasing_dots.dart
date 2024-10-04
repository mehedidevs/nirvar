import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

// Your custom widget for SpinKitChasingDots
class CustomChasingDots extends StatelessWidget {
  final Color? color;
  final double? size;

  // Constructor with optional color and size
  const CustomChasingDots({
    Key? key,
    this.color, // optional color field
    this.size,  // optional size field
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: color ?? AppColors.primary, // Default color if not provided
      size: size ?? 25.sp,         // Default size if not provided
    );
  }
}
